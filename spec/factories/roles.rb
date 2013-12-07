FactoryGirl.define do
  factory :role do
    sequence(:name) { |n| "Role-#{n}" }
    sequence(:key) { |n| "role-#{n}" }
  end
end
