class DashboardController < ApplicationController
  include Secured
  before_action :set_speaker

  def show
    @conference = Conference.find_by(abbr: params[:event])
  end
end
