class EmailMailer < ActionMailer::Base
  default from: "libratechile@gmail.com"

  def welcome_reader(user)
    @user = user.user
    mail(to: @user.email, subject: 'Sample Email')
 end
end
