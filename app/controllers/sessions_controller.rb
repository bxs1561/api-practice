class SessionsController < ApplicationController
  def login
  end

  # def create
  #   user = User.find_by(email: params[:email])
  #   if user && user.authenticate(params[:password])
  #     session[:user_id]=user.id
  #     redirect_to root_path
  #   else
  #     render :login
  #     end
  # end
  # def destroy
  #   session[:user_id]=false
  #   redirect_to '/'
  # end
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        # cookies[:auth_token] = user.auth_token
        cookies.permanent[:auth_token] = user.auth_token
        # session[:user_id] = user.id
      end
      redirect_to root_path
    else
      render :login
    end
  end

def destroy
  cookies.delete(:auth_token)
  redirect_to '/'
end
  end
