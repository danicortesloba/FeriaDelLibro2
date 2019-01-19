class EmailMailer < ApplicationMailer
  default from: "libratechile@gmail.com"

  def welcome_reader(user)
   @user = user
   mail(to: @user.email, subject: 'Sample Email')
 end
end
