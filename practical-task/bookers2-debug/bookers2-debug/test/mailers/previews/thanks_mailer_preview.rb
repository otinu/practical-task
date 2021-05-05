# Preview all emails at http://localhost:3000/rails/mailers/thanks_mailer
class ThanksMailerPreview < ActionMailer::Preview

#アクセスをする際には、amazonaws.comの後ろに/rails/mailers/thanks_mailer/welcome を付与。
  def welcome
    ThanksMailer.with(to: "perfect_rails@example.com", name: "igaiga").send_signup_email
  end
end
