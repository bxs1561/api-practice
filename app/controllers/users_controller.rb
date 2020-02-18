class UsersController < ApplicationController
  def signup
    @users = User.new
  end

  def create
    @users = User.new(user_params)
    if @users.save
      redirect_to root_path, notice: "User #{params[:email]} was successfully created."
    else
      render :signup
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
