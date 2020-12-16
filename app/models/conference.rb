class Conference < ApplicationRecord
  enum status: { registered: 0, opened: 1, closed: 2 }

  has_many :speakers

  def to_param
    abbr
  end
end
