require 'rails_helper'

RSpec.describe Author, type: :model do
  %i(first_name last_name biography).each do |symb|
    it { should have_db_column(symb) }

  end

  %i(first_name last_name).each do |symb|
    it { should validate_presence_of(symb) }
  end

  it { should have_many(:books) }

  it 'has valid factory' do
    expect(FactoryGirl.build(:author)).to be_valid
  end
end
