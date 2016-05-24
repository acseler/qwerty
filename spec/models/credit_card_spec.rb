require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  %i(number
     cvv
     expiration_month
     expiration_year
     first_name
     last_name).each do |symb|
    it { should have_db_column(symb) }
    it { should validate_presence_of(symb) }
  end

  it { should belong_to(:customer) }
  it { should have_many(:orders) }

  it 'has valid factory' do
    expect(FactoryGirl.build(:credit_card))
  end
end
