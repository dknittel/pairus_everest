class UserMailer < ApplicationMailer
	default from: 'daknittel11@gmail.com'
 
  def pair_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'You have a pair match').deliver_now
    p "MAILLLLLLLLLLLLLLLLLLLL"
  end
end
