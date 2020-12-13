class Conference < ApplicationRecord
  def to_param
    abbr
  end
end
