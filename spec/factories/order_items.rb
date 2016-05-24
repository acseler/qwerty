FactoryGirl.define do
  factory :order_item do
    price { FFaker.numerify('###.##') }
    quantity { rand(1..9) }
    book { FactoryGirl.create(:book) }
    order { FactoryGirl.create(:order) }
  end
end
