class Talk < ApplicationRecord
  has_many :registered_talks
  has_many :profiles, through: :registered_talks
end
