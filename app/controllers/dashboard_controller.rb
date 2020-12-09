class DashboardController < ApplicationController
  include Secured
  before_action :set_profile

  def show
    @conference = Conference.find_by(abbr: params[:event])
  end

  private

  def set_profile
    if @current_user
      @profile = Profile.find_by(email: @current_user[:info][:email])
    end
  end
end
