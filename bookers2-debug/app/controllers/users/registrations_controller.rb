class Users::RegistrationsController < Devise::RegistrationsController
  
  def create
      super
      ThanksMailer.send_signup_email(params[:user][:email],params[:user][:name]).deliver
      #ThanksMailer.send_signup_email(current_user).deliver
    end
end