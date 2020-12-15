class Talk < ApplicationRecord
  has_many :talks_speakers
  has_many :speakers, through: :talks_speakers
end
