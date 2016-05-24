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
  %w(vasya@namatrase.com ololo1@gmail.com).each do |line|
    it { should allow_value(line).for(:email) }
  end

  %w(asd.ds.com gogi@sa2s.com fufl@aa,com ppaaw@gmail.2w2).each do |line|
    it { should_not allow_value(line).for(:email) }
  end

  it 'has valid factory' do
    expect(FactoryGirl.build(:customer)).to be_valid
  end
end
