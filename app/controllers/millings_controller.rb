class MillingsController < ApplicationController
  load_and_authorize_resource

  def index
    @bycomments = Book.joins(:comments).group("books.id").order("count(books.id)DESC")
    @books = Book.all
    @publisher = current_user.publisher
    @millings = current_user.millings
    if @millings.any?
        @milling = current_user.millings.last
        @milling.membership_orders.each do |order|
          @price = order.membership.price
        end
        @expiration= (@milling.created_at + 1.year)
   end
  end

  def alternative
    @bycomments = Book.joins(:comments).group("books.id").order("count(books.id)DESC")

  end

  def pre_pay
    orders = current_user.membership_orders.cart
    precios = orders.map do |order|
    order.membership.price/700
    end
    total = precios.sum
    items = orders.map do |order|
      item = {}
      item[:sku] = order.id.to_s
      item[:name] = order.membership.name
      item[:price] = order.membership.price/700
      item[:currency] = 'USD'
      item[:quantity] = 1
      item
    end
    @payment = PayPal::SDK::REST::Payment.new({
        :intent =>  "sale",
        :payer =>  {
          :payment_method =>  "paypal" },
          :redirect_urls => {
          :return_url => execute_millings_url,
          :cancel_url => "http://localhost:3000/" },
          :transactions =>  [{ :item_list => { items: items },:amount =>  {:total =>  total.to_s, :currency =>  "USD" },:description =>  "Carro de compras." }]})
        if @payment.create
          redirect_url = @payment.links.find{|v| v.method == "REDIRECT" }.href
          redirect_to redirect_url
        else
          render json: @payment.error
        end
    end

    def execute
      paypal_payment = PayPal::SDK::REST::Payment.find(params[:paymentId])

      if paypal_payment.execute(payer_id: params[:PayerID])
          amount = paypal_payment.transactions.first.amount.total
          milling = Milling.create(
          user: current_user,
          code: paypal_payment.id,
          payment_method: 'paypal',
          amount: amount,
          currency: 'USD'
          )

          orders = current_user.membership_orders.cart
          orders.update_all(paid: true, milling_id: milling.id)

          redirect_to millings_path, notice: "¡La compra se realizó con éxito!"
      else
          render plain: "No se puedo generar el cobro en PayPal."
      end
    end
end
