class ApplicationController < ActionController::Base
  helper_method :current_user

  private
  def current_user
    # if cookies[:auth_token]
      @current_user ||= User.all.where("auth_token =?", cookies[:auth_token]) if cookies[:auth_token]
    # @current_user = User.find_by_auth_token(cookies[:auth_token])

    # else
    #   @current_user = nil
    end
end
