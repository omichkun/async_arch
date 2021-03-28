class MainController < ApplicationController
  skip_before_action :check_auth

  def index
    redirect_to tasks_path if user_logged_in?
  end

  def callback
    auth_info = request.env['omniauth.auth']
    if auth_info.present?
      user_params = {
        username: auth_info.dig('info', 'full_name'),
        email: auth_info.dig('info', 'email'),
        role: auth_info.dig('info', 'role'),
        public_id: auth_info.dig('info', 'public_id'),
        active: auth_info.dig('info', 'active'),
        token: auth_info.dig('credentials', 'token'),
        token_expires_at: Time.at(auth_info.dig('credentials', 'expires_at')),
      }.compact
      user = User.find_by(public_id: user_params[:public_id])
      if user.present?
        user.update(active: auth_info.dig('info', 'active'),
                    token: auth_info.dig('credentials', 'token'),
                    token_expires_at: Time.at(auth_info.dig('credentials', 'expires_at')))
        update_session_params(auth_info)
        redirect_to tasks_path
      else
        User.create(user_params)
        update_session_params(auth_info)
        redirect_to tasks_path
      end
    else
      render json: {error: 'fail'}
    end
  end

  def logout
    session.destroy
    redirect_to 'http://localhost:3001/accounts/me'
  end

  private
  def update_session_params(auth_info)
    session[:user] = auth_info.dig('info', 'public_id')
    session[:token] = auth_info.dig('credentials', 'token')
    session[:token_expires_at] = auth_info.dig('credentials', 'expires_at')
  end

  def login
    redirect_to ENV['AUTH_URL']
  end

end