class Conference < ApplicationRecord
  has_many :speakers

  def to_param
    abbr
  end
end
