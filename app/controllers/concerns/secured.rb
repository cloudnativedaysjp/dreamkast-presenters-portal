module Secured
  extend ActiveSupport::Concern

  included do
    before_action :logged_in_using_omniauth?, :set_profile
  end

  # If user already logged in by omniauth, set session information to @current_user
  # If user doesn't logged in, redirect to login page
  def logged_in_using_omniauth?
    if logged_in?
      @current_user = session[:userinfo]
    end

    if !logged_in? && ["profiles"].include?(controller_name)
      redirect_to "/auth/auth0"
    end

    if new_user? #&& !["profiles"].include?(controller_name)
      redirect_to "/#{params[:event]}/registration"
    end
  end

  def logged_in?
    session[:userinfo].present?
  end

  def set_profile
    if @current_user
      @profile = Profile.find_by(email: @current_user[:info][:email])
    end
  end

  def new_user?
    session[:userinfo].present? && !Profile.find_by(email: @current_user[:info][:email])
  end
end

