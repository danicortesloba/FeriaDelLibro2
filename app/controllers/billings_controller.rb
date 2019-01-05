class BillingsController < ApplicationController
  def prepay
    orders = current_user.orders.where(payed: false)
    precios = orders.map do |order|
      order.book.price
    end
    total = precios.sum
    items = orders.map do |order|
      item = {}
      item[:sku] = order.id.to_s
      item[:name] = order.book.title
      item[:price] = order.book.price.to_s
      item[:currency] = 'CLP'
      item[:quantity] = 1
      item
    end
    @payment = PayPal::SDK::REST::Payment.new({
        :intent =>  "sale",
        :payer =>  {
          :payment_method =>  "paypal" },
        :redirect_urls => {
          :return_url => "http://localhost:3000/payment/execute",
          :cancel_url => "http://localhost:3000/" },
        :transactions =>  [{
          :item_list => {
            items: items
            },
          :amount =>  {
            :total =>  total.to_s,
            :currency =>  "CLP" },
          :description =>  "Carro de compras." }]})

        if @payment.create
          render json: @payment.to_json
        else
          ":()"
        end
  end
end
