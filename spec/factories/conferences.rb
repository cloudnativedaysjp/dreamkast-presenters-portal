FactoryBot.define do
  factory :event_001, class: Conference do
    id { 1 }
    name { 'Event 001'}
    abbr { 'ev001' }
    status { 0 }
  end
end