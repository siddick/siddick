# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    user nil
    title "MyString"
    content "MyText"
    raw_content "MyText"
    raw_content_type "MyString"
    published false
  end
end
