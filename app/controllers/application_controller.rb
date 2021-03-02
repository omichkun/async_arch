class ApplicationController < ActionController::Base
  before_action :check_auth

  private
  def check_auth
    redirect_to root_path unless user_logged_in?
  end

  def user_logged_in?
    session[:user].present?
  end

  def error!(status: 422)
    render(plain: "You have no acccess here. Error: #{status}", status: status)
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user])
  end
end
