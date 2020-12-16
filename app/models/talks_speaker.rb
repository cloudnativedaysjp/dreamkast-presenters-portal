class TalksSpeaker < ApplicationRecord
  belongs_to :talk
  belongs_to :speaker
  validates :speaker_id,  uniqueness: { scope: :talk_id }
end
