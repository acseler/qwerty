require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:states) { %w(in\ progress completed shipped) }

  %i(total_price
     completed_date
     state
     customer_id
     credit_card_id
     billing_address_id
     shipping_address_id).each do |symb|
    it { should have_db_column(symb) }
  end

  %i(customer credit_card billing_address shipping_address).each do |symb|
    it { should belong_to(symb) }
  end

  %i(total_price completed_date state).each do |symb|
    it { should validate_presence_of(symb) }
  end

  it { should have_many(:order_items) }
  it { should validate_inclusion_of(:state).in_array(states) }

  it 'has valid factory' do
    expect(FactoryGirl.build(:order)).to be_valid
  end
end
