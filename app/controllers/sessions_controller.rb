class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    # @user = User.new
    if user&.authenticate(params[:password])
      if user.email_confirmed
        session[:user_id] = user.id
        redirect_to boards_path, notice: "You're signed in!"
      else
        flash.now[:error] = 'Please check your email and activate your account'
        redirect_to root_path
      end
    else
      flash.now[:alert] = "Wrong email or password!"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out!"
  end

  # private
  # Implement 'form_for :session' on the sign-in page first
  # def session_params
  #   params.require(:session).permit(:email, :password)
  # end
end
