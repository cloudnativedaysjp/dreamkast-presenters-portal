FactoryBot.define do
  factory :alice, class: Speaker do
    id { 1 }
    # sub { 'aaa' }
    email { 'foo@example.com' }
    name { 'Alice' }
    conference_id { 1 }
    # industry_id { '1' }
    # occupation { 'aaa' }
    # company_name { 'aa' }
    # company_email { 'bar@example.com' }
    # company_address { 'aa' }
    # company_tel { '123-4567-8901' }
    # department { 'aa' }
    # position { 'aaa' }
  end
end