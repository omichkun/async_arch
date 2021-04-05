class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  skip_before_action :check_auth, only: :callback

  def create
    user_params = auth_hash.except(:token, :token_expires_at)
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
    redirect_to root_path
  end

  def login
    redirect_to ENV['AUTH_URL']
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
      }.compact
      user = User.find_by(public_id: user_params[:public_id])
      if user.present?
        user.update(active: auth_info.dig('info', 'active'))
        update_session_params(auth_info)
        redirect_to root_path
      else
        User.create(user_params)
        update_session_params(auth_info)
        redirect_to root_path
      end
    else
      render json: {error: 'fail'}
    end
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

  def update_session_params(auth_info)
    session[:user] = auth_info.dig('info', 'public_id')
    session[:token] = auth_info.dig('credentials', 'token')
    session[:token_expires_at] = auth_info.dig('credentials', 'expires_at')
  end
end