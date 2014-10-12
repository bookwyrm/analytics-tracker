# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :analytics_entry do
    site ""
    url "MyString"
    user_agent "MyString"
  end
end
