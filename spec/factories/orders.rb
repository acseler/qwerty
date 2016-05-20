FactoryGirl.define do
  factory :order do
    total_price "9.99"
    completed_date "2016-05-20 16:49:49"
    state "MyString"
    customer nil
    credit_card nil
    billing_address_id 1
    shipping_address_id 1
  end
end
