# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account do
    company_name "MyString"
    primary_timezone "MyString"
    account_owner nil
  end
end
