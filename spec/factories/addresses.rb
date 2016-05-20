FactoryGirl.define do
  factory :address do
    address { FFaker::AddressUA.street_address }
    zipcode { FFaker::AddressUA.zip_code }
    city { FFaker::AddressUA.city }
    phone { FFaker::PhoneNumber.phone_number }
    country { FactoryGirl.create(:country) }
  end
end
