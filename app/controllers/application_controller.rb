class ApplicationController < ActionController::Base
  def current_user
    if cookies[:auth_token]
      @current_user ||= User.find_by_auth_token(cookies[:auth_token])
    else
      @current_user = nil
    # @current_user ||=User.find_by_auth_token!(cookies[:auth_token]).id if cookies[:auth_token]
    end
  end
  def logged_in?
    not cookies[:auth_token].nil?
    # cookies[:auth_token] = true

  end

  helper_method :current_user
  helper_method :logged_in?
end
