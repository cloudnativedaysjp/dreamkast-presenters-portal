class SpeakerForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attr_accessor :name,
                :email,
                :sub,
                :conference_id,
                :talks

  delegate :persisted?, to: :speaker

  concerning :TalksBuilder do
    attr_accessor :talks

    def talks
      @talks ||= []
    end

    def talks_attributes=(attributes)
      @talks ||= []
      attributes.each do |_i, params|
        if params.key?(:id)
          if params[:_destroy] == "1"
            talk = @speaker.talks.find(params[:id])
            talks_speaker = TalksSpeaker.find_by(speaker_id: @speaker.id, talk_id: talk.id)
            talks_speaker.destroy
            talk.destroy
          else
            params.delete(:_destroy)
            image = @speaker.talks.find(params[:id])
            image.update(params)
          end
        else
          params.delete(:_destroy)
          talk = Talk.new(params)
          talk.save!
          begin
            rtalk = TalksSpeaker.new(talk_id: talk.id, speaker_id: @speaker.id)
            rtalk.save!
          rescue => e
            puts e
          end
          @talks.push(talk)
        end
      end
    rescue => e
      puts e
      false
    end
  end

  def initialize(attributes = nil, speaker: Speaker.new)
    @speaker = speaker
    attributes ||= default_attributes
    super(attributes)
  end

  def speaker
    @speaker
  end

  def save
    return if invalid?

    ActiveRecord::Base.transaction do
      puts "conference_id #{conference_id}"
      speaker.update!(name: name, sub: sub, email: email, conference_id: conference_id)
    end
  rescue => e
    puts "faild to save: #{e}"
    false
  end

  def to_model
    speaker
  end

  def load
    @talks = @speaker.talks
    @sub = @speaker.sub
    @email = @speaker.email
  end

  attr_reader :speaker

  private

  def default_attributes
    {
      name: speaker.name,
      email: speaker.email,
      sub: speaker.sub,
      talks: talks
    }
  end
end