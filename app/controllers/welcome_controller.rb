class WelcomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to boards_path
    end
    @user = User.new
  end

end
