class Speaker < ApplicationRecord
  belongs_to :conference
  has_many :talks_speakers
  has_many :talks, through: :talks_speakers
end
