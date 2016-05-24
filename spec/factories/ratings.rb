FactoryGirl.define do
  factory :rating do
    review { FFaker::CheesyLingo.paragraph(100) }
    rating { rand(1..10) }
    customer { FactoryGirl.create(:customer) }
    book { FactoryGirl.create(:book) }
  end
end
