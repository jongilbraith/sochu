FactoryGirl.define do
  factory :scheduled_update do
    user
    content { Faker::Lorem.sentence }
    due_at { 1.minute.from_now }
  end
end
