FactoryBot.define do
  factory :task do
    name
    description
    author factory: :manager
    assignee factory: :developer
    state { :new_task.to_s }
    expired_at
  end
end
