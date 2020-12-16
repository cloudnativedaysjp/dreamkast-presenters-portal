module Secured
  extend ActiveSupport::Concern

  included do
    before_action :logged_in_using_omniauth?, :set_speaker
  end

  # If user already logged in by omniauth, set session information to @current_user
  # If user doesn't logged in, redirect to login page
  def logged_in_using_omniauth?
    if logged_in?
      @current_user = session[:userinfo]
    end

    if !logged_in? && ["speakers"].include?(controller_name)
      redirect_to "/auth/auth0"
    end

      if new_user? && !speakers_new? && !speakers_create?
      redirect_to "/#{params[:event]}/speakers/registration"
    end
  end

  def speakers_new?
    controller_name == 'speakers' && action_name == 'new'
  end

  def speakers_create?
    controller_name == 'speakers' && action_name == 'create'
  end

  def logged_in?
    session[:userinfo].present?
  end

  def set_speaker
    if @current_user
      @speaker = Speaker.find_by(email: @current_user[:info][:email])
    end
  end

  def new_user?
    session[:userinfo].present? && !Speaker.find_by(email: @current_user[:info][:email])
  end
end

