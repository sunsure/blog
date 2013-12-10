FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Mark Holmberg-#{n}"}
    sequence(:email) { |n| "user-#{n}@example.com" }
    password "foobar123"
    password_confirmation "foobar123"
  end
end
