FactoryGirl.define do
  factory :credit_card do
    number { FFaker.numerify('################') }
    cvv { FFaker.numerify('##########') }
    expiration_month { FFaker::Time.month }
    expiration_year { FFaker::Time.date({ year_range: -2 })[1..4].to_i }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    customer { FactoryGirl.build(:customer) }
  end
end
