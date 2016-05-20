require 'rails_helper'

RSpec.describe Address, type: :model do
  %i(address zipcode city phone country_id).each do |symb|
    it { should have_db_column(symb) }
    it { should validate_presence_of(symb) }
  end

  it 'has valid factory' do
    expect(FactoryGirl.build(:address)).to be_valid
  end
end
