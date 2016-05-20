FactoryGirl.define do
  factory :book do
    title { FFaker::CheesyLingo.title }
    description { FFaker::CheesyLingo.paragraph(100) }
    price { FFaker.numerify('###.##') }
    stock { FFaker.numerify('#') }
    category { FactoryGirl.create(:category) }
    author { FactoryGirl.create(:author) }
  end
end
