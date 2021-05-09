class ThanksMailer < ApplicationMailer

=begin 
  def send_signup_email(email, name)
    @name = name
    mail to: email, subject: 'Registration Complete! Thanks for Joining!'
  end
=end

  def send_signup_email(user)
    @name = user.name #模範解答はここでcurrent_userを全てインスタンス変数に格納していた。
    mail(:subject => "登録完了のお知らせ", to: user.email) #current_userのパラメータは全てインスタンス変数に格納されているため、ここでNilのためにエラーが発生する。
  end

end
