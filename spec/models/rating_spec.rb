require 'rails_helper'

RSpec.describe Rating, type: :model do

  %i(review rating customer_id book_id).each do |symb|
    it { should have_db_column(symb) }
  end

  %i(customer book).each do |symb|
    it { should belong_to(symb) }
  end

  %i(review rating).each do |symb|
    it { should validate_presence_of(symb) }
  end

  it { should validate_inclusion_of(:rating).in_range(1..10) }

  it 'has valid factory' do
    expect(FactoryGirl.build(:rating)).to be_valid
  end

end
