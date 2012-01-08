# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    association   :user
    title         "Title"
    raw_content   "Content"
    published     true
    published_at  2.days.ago
  end
end
