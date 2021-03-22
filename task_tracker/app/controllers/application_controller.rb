class ApplicationController < ActionController::Base
  before_action :check_auth

  private
  def check_auth
    auth_url = "#{ENV['AUTH_URL']}/oauth/authorize?client_id=#{ENV['AUTH_APP_ID']}&redirect_uri=#{CGI::escape(ENV['ROOT_URL'])}&response_type=code&scope=#{ENV['AUTH_SCOPE']}"
    redirect_to auth_url unless user_logged_in?
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
