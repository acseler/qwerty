require 'rails_helper'

RSpec.describe Customer, type: :model do
  %i(email password first_name last_name).each do |symb|
    it { should have_db_column(symb) }
    it { should validate_presence_of(symb) }
  end

  %i(orders ratings).each do |symb|
    it { should have_many(symb) }
  end

  it { should validate_uniqueness_of(:email) }

  it 'has valid factory' do
    expect(FactoryGirl.build(:customer)).to be_valid
  end

end
