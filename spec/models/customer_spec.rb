require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject(:customer) { FactoryGirl.create(:customer) }

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

  context '#new_order' do
    it 'creates new order' do
      expect { customer.new_order(completed_date: Time.now) }
          .to change { customer.orders.size }.by(1)
    end
  end

  context '#current_order' do
    it "returns blank if there is no orders with 'in progress' state" do
      expect(customer.current_order).to be_blank
    end

    it "returns order with 'in progress' state" do
      order = customer.new_order(completed_date: Time.now)
      expect(order).to respond_to(:total_price, :completed_date, :state)
      expect(order.state).to eq('in progress')
    end
  end
end
