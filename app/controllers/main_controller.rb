class MainController < ApplicationController
  skip_before_action :check_auth

  def index
  end

  def login
    user = User.find_by(id: params[:id])
    session[:user] = user.id if user.present?
    redirect_to tasks_path
  end

end