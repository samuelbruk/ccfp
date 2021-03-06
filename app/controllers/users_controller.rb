class UsersController < ApplicationController
  before_action :force_json, only: :search

  def create
    @user = User.new user_params

    if @user.save
      # UserMailer.registration_confirmation(@user).deliver
      # TODO remove '@user.update..', 'session[:user_id]..' and enable 'UserMailer..' to enable email-ver
      @user.update(email_confirmed: true)
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Thank you for signing up!"
    else
      flash.now[:alert] = @user.errors.full_messages.join(', ')
      redirect_to root_path
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      session[:user_id] = user.id
      flash[:success] = "Welcome to the Sample App."
      redirect_to boards_path
    else
      flash[:error] = "Sorry. User does not exist."
      redirect_to root_path
    end
  end

  def search
    # puts params[:term]
    @search = User.ransack(first_name_or_last_name_or_email_cont: params[:term]).result().limit(5)
    # byebug
    # render json: ['samuel'].to_json
  end

  private
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end

  def force_json
    request.format = :json
  end
end
