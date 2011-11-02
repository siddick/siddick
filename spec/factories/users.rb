# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@example.com"
  end

  factory :user do
    name      "User"
    email     { Factory.next(:email) }
    password  "password"
  end
end
