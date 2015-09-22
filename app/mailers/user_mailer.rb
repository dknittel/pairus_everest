class UserMailer < ApplicationMailer
	default from: 'pairuseverest@gmail.com'
 
  def pair_email(user)
    @user = user
    @url  = 'http://www.google.com'
    mail(to: @user.email,  subject: 'You have a pair match')
  end
end
# body: email_body,
          # content_type: "text/html",