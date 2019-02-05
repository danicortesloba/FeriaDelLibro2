# Preview all emails at http://localhost:3000/rails/mailers/email_mailer
class EmailMailerPreview < ActionMailer::Preview

  def welcome_reader_preview
   EmailMailer.welcome_reader(User.first)
 end

end
