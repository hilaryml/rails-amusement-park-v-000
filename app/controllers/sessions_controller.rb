class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user), alert: "Welcome back to the theme park!"
    else
      redirect_to signin_path, alert: "Incorrect login info. Please, try again."
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
