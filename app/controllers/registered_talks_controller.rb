class RegisteredTalksController < ApplicationController
  before_action :set_registered_talk, only: [:show, :edit, :update, :destroy]

  # GET /registered_talks
  # GET /registered_talks.json
  def index
    @registered_talks = RegisteredTalk.all
  end

  # GET /registered_talks/1
  # GET /registered_talks/1.json
  def show
  end

  # GET /registered_talks/new
  def new
    @registered_talk = RegisteredTalk.new
  end

  # GET /registered_talks/1/edit
  def edit
  end

  # POST /registered_talks
  # POST /registered_talks.json
  def create
    @registered_talk = RegisteredTalk.new(registered_talk_params)

    respond_to do |format|
      if @registered_talk.save
        format.html { redirect_to @registered_talk, notice: 'Registered talk was successfully created.' }
        format.json { render :show, status: :created, location: @registered_talk }
      else
        format.html { render :new }
        format.json { render json: @registered_talk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registered_talks/1
  # PATCH/PUT /registered_talks/1.json
  def update
    respond_to do |format|
      if @registered_talk.update(registered_talk_params)
        format.html { redirect_to @registered_talk, notice: 'Registered talk was successfully updated.' }
        format.json { render :show, status: :ok, location: @registered_talk }
      else
        format.html { render :edit }
        format.json { render json: @registered_talk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registered_talks/1
  # DELETE /registered_talks/1.json
  def destroy
    @registered_talk.destroy
    respond_to do |format|
      format.html { redirect_to registered_talks_url, notice: 'Registered talk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registered_talk
      @registered_talk = RegisteredTalk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def registered_talk_params
      params.require(:registered_talk).permit(:speaker_id, :talk_id)
    end
end
