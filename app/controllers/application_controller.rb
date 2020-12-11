class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    render template: 'errors/error_403', status: 403, layout: 'application', content_type: 'text/html'
  end

  helper_method :registered?, :logged_in?

  def logged_in?
    session[:userinfo].present?
  end

  def registered?
    !new_user?
  end
end
