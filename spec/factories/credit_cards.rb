FactoryGirl.define do
  factory :credit_card do
    number "MyString"
    cvv "MyString"
    expiration_month 1
    expiration_year 1
    first_name "MyString"
    last_name "MyString"
    customer nil
  end
end