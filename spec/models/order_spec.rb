require 'rails_helper'

RSpec.describe Order, type: :model do
  subject(:book) { FactoryGirl.create(:book) }
  subject(:order) { FactoryGirl.create(:order) }
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

  it { is_expected.to callback(:assign_total_price).before(:save) }

  it { should have_many(:order_items) }
  it { should validate_inclusion_of(:state).in_array(states) }

  it 'has valid factory' do
    expect(FactoryGirl.build(:order)).to be_valid
  end

  context '#add_book' do
    it 'creates new order_item' do
      expect{ order.add_book(book, 4) }.to change{ order.order_items.size }.by(1)
    end

    context do
      subject(:book) { Book.create(id: 33, title: 'Book', price: 111, stock: 5) }
      subject(:order)  { Order.create(id: 44, completed_date: Time.now) }
      before { order.add_book(book, 1) }

      it 'does not create new item' do
        expect{ order.add_book(book, 1) }
            .not_to change { order.order_items.size }
      end

      it 'updates quantity on adding the same book to order' do
        expect{ order.add_book(book, 1) }
            .to change{ order.order_items.find_by(book: book).quantity }.by(1)
      end
    end
  end

  context '#assign_total_price' do
    it 'calculates total_price and set assign total price' do
      book.price = 100
      order.add_book(book, 4)
      expect{ order.send(:assign_total_price) }
          .to change{ order.total_price }.by(400)
    end
  end
end
