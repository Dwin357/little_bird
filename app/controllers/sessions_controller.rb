class SessionsController < ApplicationController
  def new
  end

  def create
    u = User.find_by(username: session_params[:username])
    if u && u.authentic_password?(session_params[:password])
      login(u)
      redirect_to user_path(u)
    else
      flash[:data] = {username: session_params[:username]}
      flash[:errors] = ["invalid username or password"]
      render "new"
    end
  end

  def destroy
    logout
    redirect_to new_session_path
  end

  private
  def session_params
    params.require(:session).permit(:username, :password)
  end
end