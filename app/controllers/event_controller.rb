class EventController < ApplicationController
  include Secured
  before_action :set_profile

  def show
    @conference = Conference.find_by(abbr: params[:event])
    # if session[:userinfo].present?
    #   redirect_to profile_path
    # end
  end

  def logged_in_using_omniauth?
    if session[:userinfo].present?
      @current_user = session[:userinfo]
    end
  end

  private

  def set_profile
    if @current_user
      @profile = Profile.find_by(email: @current_user[:info][:email])
    end
  end
end