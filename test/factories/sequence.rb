FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :string, aliases: [:first_name, :last_name, :password, :avatar,
                              :type, :name, :state] do |n|
    "string#{n}"
  end

  sequence :text, aliases: [:description] do |n|
    "example#{n}"
  end

  sequence :date, aliases: [:expired_at] do |n|
    "#{n}-01-01"
  end
end
