class SessionsController < ApplicationController
  def new
  end

  def create
    username = params[:user][:username]
    password = params[:user][:password]
    user = User.find_by(username:  username)

    if user.authenticate(password)
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully"
    else
      redirect_to login_path, aler: "Invalid username/password"
    end
    
  end

  def destroy
    reset_session
    redirect_to login_path
  end
end
