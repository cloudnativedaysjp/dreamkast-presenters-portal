class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def user_not_authorized
    render template: 'errors/error_403', status: 403, layout: 'application', content_type: 'text/html'
  end

  def render_404
    render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
  end


  helper_method :registered?, :logged_in?

  def logged_in?
    session[:userinfo].present?
  end

  def registered?
    !new_user?
  end
end
