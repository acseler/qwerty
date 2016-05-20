require 'rails_helper'

RSpec.describe Category, type: :model do
  %i(title).each do |symb|
    it { should have_db_column(symb) }
    it { should validate_presence_of(symb) }
    it { should validate_uniqueness_of(symb) }
  end

  it { should have_many(:books) }

  it 'has valid factory' do
    expect(FactoryGirl.build(:category)).to be_valid
  end
end
