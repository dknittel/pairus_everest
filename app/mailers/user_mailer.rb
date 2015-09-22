class UserMailer < ApplicationMailer
	default from: 'pairuseverest@gmail.com'
 
  def pair_email(user, user2, topic, time)
    @user = user
    @user2 = user2
    @topic = topic
    @time = time
    @url  = 'http://www.google.com'
    mail(to: @user.email,  subject: 'You have a pair match')
  end
end
# body: email_body,
          # content_type: "text/html",