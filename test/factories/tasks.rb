FactoryBot.define do
  factory :task do
    name
    description
    author factory: :manager
    assignee factory: :developer
    state { generate :task_state }
    expired_at
  end
end
