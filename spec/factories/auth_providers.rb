# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :uid do |n|
    "uid-#{n}"
  end
  factory :auth_provider do
    provider "provider"
    uid      { FactoryGirl.generate(:uid) }
    association   :user
  end
end
