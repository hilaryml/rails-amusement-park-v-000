class UsersController < ApplicationController
  before_action :require_login, only: [:show]
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user, notice: "Welcome to the theme park!")
    else
      redirect_to new_user_path
    end
  end

  def edit
  end

  def update
    if current_user == @user
      @user.update(user_params)
      redirect_to user_path(@user, notice: "User was successfully updated.")
    else
      redirect_to user_path(@user)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

end
