class Speaker < ApplicationRecord
  has_many :registered_talks
  has_many :talks, through: :registered_talks
end
