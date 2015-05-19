class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(
      user_params[:username],
      user_params[:password]
    )
    if @user
      log_in(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ["Invalid credentials"]
      redirect_to new_session_url
    end
  end

  def destroy
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
