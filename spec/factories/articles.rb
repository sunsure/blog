FactoryGirl.define do
  factory :article do
    title "MyString"
    permalink "MyString"
    excerpt "MyText"
    content "MyText"
    user { |i| i.association(:user) }
  end
end
