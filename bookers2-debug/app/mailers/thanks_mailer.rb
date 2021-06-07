class ThanksMailer < ApplicationMailer

=begin 
  def send_signup_email(email, name)
    @name = name
    mail to: email, subject: 'Registration Complete! Thanks for Joining!'
  end
=end

  def send_signup_email(email, name)
    @name = name #模範解答はここでcurrent_userを全てインスタンス変数に格納していた。
    mail to: email, subject: 'Registration Complete! Thanks for Joining!' #current_userのパラメータは全てインスタンス変数に格納されているため、ここでNilのためにエラーが発生する。
  end

end
