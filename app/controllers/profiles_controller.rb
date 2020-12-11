class Forbidden < ActionController::ActionControllerError; end

class ProfilesController < ApplicationController
  include Secured

  # GET /profiles
  # GET /profiles.json
  # def index
  #   @profiles = Profile.all
  # end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find_by(id: params[:id])
    authorize @profile

    @conference = Conference.find_by(abbr: params[:event])
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
    @conference = Conference.find_by(abbr: params[:event])
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find_by(id: params[:id])
    authorize @profile

    @conference = Conference.find_by(abbr: params[:event])
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @conference = Conference.find_by(abbr: params[:event])

    respond_to do |format|
      if @profile.save
        format.html { redirect_to "/#{@conference.abbr}", notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    @profile = Profile.find(params[:id])
    authorize @profile

    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_path(id: @profile.id), notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    authorize @profile

    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def pundit_user
    if @current_user
      Profile.find_by(email: @current_user[:info][:email])
    end
  end

  # Only allow a list of trusted parameters through.
  def profile_params
    params.require(:profile).permit(:first_name,
                                    :last_name,
                                    :email,
                                    talks_attributes: [:id, :title, :abstract])
  end
end
