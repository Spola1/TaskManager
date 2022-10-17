FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :string, aliases: [:first_name, :last_name, :password, :avatar,
                              :type, :name, :state] do |n|
    "string#{n}"
  end

  sequence :text, aliases: [:description] do |n|
    "description#{n}"
  end

  sequence :date, aliases: [:expired_at] do |n|
    "#{n}-01-01"
  end

  sequence :task_state do |_n|
    [:new_task]
  end
end
