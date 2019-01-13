class BillingsController < ApplicationController
  before_action :authenticate_user!
  def index
      @addresses = current_user.addresses.where(default:true).each do |a|
            @current=  a.address
      end
      @billing = current_user.billings.last
      @bycomments = Book.joins(:comments).group("books.id").order("count(books.id)DESC")
      @books = Book.all
      precios = @billing.orders.map do |order|
            order.book.price
      end
      @total = precios.sum
  end

  def prepay
      orders = current_user.orders.cart
      precios = orders.map do |order|
      order.book.price/700
      end
      total = precios.sum
      items = orders.map do |order|
        item = {}
        item[:sku] = order.id.to_s
        item[:name] = order.book.title
        item[:price] = order.book.price/700
        item[:currency] = 'USD'
        item[:quantity] = 1
        item
      end
      @payment = PayPal::SDK::REST::Payment.new({
          :intent =>  "sale",
          :payer =>  {
            :payment_method =>  "paypal" },
            :redirect_urls => {
            :return_url => "http://localhost:3000/billings/execute",
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
         billing = Billing.create(
         user: current_user,
         code: paypal_payment.id,
         payment_method: 'paypal',
         amount: amount,
         currency: 'USD'
         )

         orders = current_user.orders.cart
         orders.update_all(payed: true, billing_id: billing.id)

         redirect_to billings_path, notice: "La compra se realizó con éxito!"
     else
         render plain: "No se puedo generar el cobro en PayPal."
     end
   end
end
