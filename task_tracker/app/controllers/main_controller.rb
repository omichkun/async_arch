class MainController < ApplicationController
  skip_before_action :check_auth

  def index
    redirect_to tasks_path if user_logged_in?
  end

  def login
    redirect_to ENV['AUTH_URL']
  end

end