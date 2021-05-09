class ThanksMailer < ApplicationMailer

=begin 
  def send_signup_email(email, name)
    @name = name
    mail to: email, subject: 'Registration Complete! Thanks for Joining!'
  end
=end

  def send_signup_email(user)
    @name = user.name
    mail(:subject => "登録完了のお知らせ", to: user.email)
  end

end
