class Order < ActiveRecord::Base
  before_validation :assign_total_price, on: :create, unless: :total_price
  belongs_to :customer
  belongs_to :credit_card
  has_many :order_items
  belongs_to :billing_address, class_name: 'Address', foreign_key: 'billing_address_id'
  belongs_to :shipping_address, class_name: 'Address', foreign_key: 'shipping_address_id'
  validates :total_price, :completed_date, :state, presence: true
  validates :state, inclusion: { in: %w(in\ progress completed shipped) }

  def add_book(book, quantity)
    order_items.create(price: book.price, quantity: quantity, book: book)
    assign_total_price
  end

  private

  def assign_total_price
    self.total_price = order_items.inject(0) { |s, i| s + i.price * i.quantity }
  end

end
