FactoryGirl.define do
  factory :task, class: Scheduler::Schedule::Task do
    skip_create

    method_name { :perform! }
    due_at { 1.minute.from_now }
  end
end
