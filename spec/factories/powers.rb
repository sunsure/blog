FactoryGirl.define do
  factory :power do
    role { |i| i.association(:role) }
    user { |i| i.association(:user) }
  end
end
