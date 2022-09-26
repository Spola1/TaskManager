FactoryBot.define do
  factory :developer do
    first_name
    last_name
    email
    password
    type { 'Developer' }
  end
end
