class Talk < ApplicationRecord
  has_many :registered_talks
  has_many :speakers, through: :registered_talks
end
