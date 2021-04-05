class ApplicationController < ActionController::Base
  before_action :check_auth

  private
  def check_auth
    auth_url = "#{ENV['AUTH_URL']}/oauth/authorize?client_id=#{ENV['AUTH_APP_ID']}&redirect_uri=#{CGI::escape(ENV['CALLBACK_URL'])}&response_type=code&scope=#{ENV['AUTH_SCOPE']}"
    redirect_to auth_url unless user_logged_in?
  end

  def user_logged_in?
    session[:user].present? && session[:token].present? && session[:token_expires_at].present? && Time.at(session[:token_expires_at]) > Time.now
  end

  def error!(status: 422)
    render(plain: "You have no acccess here. Error: #{status}", status: status)
  end

  def current_user
    @current_user ||= User.find_by(public_id: session[:user])
  end
end
