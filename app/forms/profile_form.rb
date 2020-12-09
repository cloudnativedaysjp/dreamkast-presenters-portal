class ProfileForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attr_accessor :last_name,
                :first_name,
                :email

  delegate :persisted?, to: :profile

  concerning :TalksBuilder do
    attr_accessor :talks

    def talks
      @talks ||= [Talk.new]
    end

    def talks_attributes=(attributes)
       @talks ||= []
      attributes.each do |_i, params|
        if params.key?(:id)
          if params[:_destroy] == "1"
            image = @profile.talks.find(params[:id])
            image.destroy
          else
            params.delete(:_destroy)
            image = @profile.talks.find(params[:id])
            image.update(params)
          end
        else
          params.delete(:_destroy)
          talk = Talk.new(params)
          talk.save!
          begin
            rtalk = RegisteredTalk.new(talk_id: talk.id, profile_id: @profile.id)
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

  def initialize(attributes = nil, profile: Profile.new)
    @profile = profile
    attributes ||= default_attributes
    super(attributes)
  end

  def profile
    @profile
  end

  def save
    return if invalid?

    ActiveRecord::Base.transaction do
      profile.update!(last_name: last_name, first_name: first_name, email: email)
    end
  rescue => e
    puts e
    false
  end

  def to_model
    profile
  end

  def load
    @talks = @profile.talks
  end

  attr_reader :profile

  private

  def default_attributes
    puts "default_attributes"
    r = {
      last_name: profile.last_name,
      first_name: profile.first_name,
      email: profile.email,
      talks: talks
    }
  end
end