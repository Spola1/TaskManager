FactoryBot.define do
  factory :task do
    name
    description
    author factory: :manager
    assignee factory: :developer
    state { (generate :task_state).to_s }
    expired_at { (Time.now + 1.hour).to_date }
  end
end
