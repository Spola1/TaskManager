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

  sequence :task_state do |n|
    [:new_task, :in_development, :in_qa, :in_code_review, :ready_for_release, :released, :archived].sample
  end
end
