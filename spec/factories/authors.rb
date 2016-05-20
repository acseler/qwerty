FactoryGirl.define do
  factory :author do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    biography { FFaker::CheesyLingo.paragraph(256) }
  end
end
