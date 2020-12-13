class Speaker < ApplicationRecord
  belongs_to :conference
  has_many :registered_talks
  has_many :talks, through: :registered_talks
end
