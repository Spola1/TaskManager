FactoryBot.define do
  factory :manager do
    first_name
    last_name
    email
    password
    type { 'Manager' }
  end
end
