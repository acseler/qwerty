FactoryGirl.define do
  factory :order do
    total_price { FFaker.numerify('###.##') }
    completed_date { FFaker::Time.date }
    state 'in progress'
    customer { FactoryGirl.create(:customer) }
    credit_card { FactoryGirl.create(:credit_card) }
    billing_address { FactoryGirl.create(:address) }
    shipping_address { FactoryGirl.create(:address) }
  end
end
