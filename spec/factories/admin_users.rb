# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_user do
    name      "Admin"
    email     { Factory.next(:email) }
    password  "password"
  end
end
