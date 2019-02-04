class BillingsController < ApplicationController
  load_and_authorize_resource

  def index
      @bycomments = Book.joins(:comments).group("books.id").order("count(books.id)DESC")
      @books = Book.all
      @reader = current_user.reader
      @addresses = current_user.addresses.where(default:true).each do |a|
            @adr =  a.address
            @com = a.commune
            @reg = a.region
      end
      @billings = current_user.billings
      if @billings.any?
        @billing = current_user.billings.last
        precios = @billing.orders.map do |order|
              order.book.price
        end
        @billing.orders.each do |order|
          @publisher_address = order.book.publisher.user.addresses.last
        end
      @total = precios.sum
      @expiration = (@billing.created_at + 20.days)
      @expiration_complaint = (@billing.created_at + 30.days)
      end
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

         @billings = current_user.billings
         if @billings.any?
           @billing = current_user.billings.last
           @billing.orders.each do |order|
              EmailMailer.sale_confirmation(@billing).deliver_now
          end
        end


         redirect_to billings_path, notice: "¡La compra se realizó con éxito!"
         EmailMailer.billing_confirmation(current_user).deliver_now

     else
         render plain: "No se puedo generar el cobro en PayPal."
     end
   end
end
