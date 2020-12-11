class DashboardController < ApplicationController
  include Secured
  before_action :set_profile

  def show
    @conference = Conference.find_by(abbr: params[:event])
  end
end
