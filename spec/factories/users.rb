# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@example.com"
  end

  factory :user do
    name      "User"
    email     { FactoryGirl.generate(:email) }
    password  "password"
  end
  
  factory :admin_user do
    name      "Admin"
    email     { FactoryGirl.generate(:email) }
    password  "password"
  end

end
