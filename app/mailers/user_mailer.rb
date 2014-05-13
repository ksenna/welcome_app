class UserMailer < ActionMailer::Base
  # after_create :welcome_email

  default from: 'ahsmashsenna@gmail.com'

  def welcome_email(user)
  	@user = user
  	@url = 'http://example.com/login'
  	mail(to: @user.email, subject: 'Welcome To The User Auth & Email Site')
  end
end
