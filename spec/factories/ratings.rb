FactoryGirl.define do
  factory :rating do
    review "MyText"
    rating 1
    customer nil
    book nil
  end
end
