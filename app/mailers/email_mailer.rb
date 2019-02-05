class EmailMailer < ActionMailer::Base
  default from: "libratechile@gmail.com"
  add_template_helper(EmailHelper)

  def welcome_reader(user)
    @user = user.user
    mail(to: @user.email, subject: '¡Ya eres parte de Líbrate!')
  end

  def welcome_publisher(user)
    @user = user.user
    mail(to: @user.email, subject: '¡Ya eres parte de Líbrate!')
  end

  def billing_confirmation(user)
    @addresses = user.addresses.where(default:true).each do |a|
          @adr =  a.address
          @com = a.commune
          @reg = a.region
    end
    @billings = user.billings
    if @billings.any?
      @billing = user.billings.last
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
    @user = user
    mail(to: @user.email, subject: 'Confirmación de compra')
  end

  def sale_confirmation(billing)
      @expiration = (billing.created_at + 20.days)
      @expiration_complaint = (billing.created_at + 30.days)
      @orders = billing.orders
      @orders.each do |order|
            @publisher_address = order.book.publisher.user.addresses.last
            @addresses = order.user.addresses.where(default:true).each do |a|
                  @adr =  a.address
                  @com = a.commune
                  @reg = a.region
            end
            @user = order.book.publisher.user
            mail(to: @user.email, subject: '¡Vendiste un libro!')
      end
  end
end
