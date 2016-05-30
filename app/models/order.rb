class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :credit_card
  has_many :order_items
  belongs_to :billing_address, class_name: 'Address', foreign_key: 'billing_address_id'
  belongs_to :shipping_address, class_name: 'Address', foreign_key: 'shipping_address_id'
  validates :total_price, :completed_date, :state, presence: true
  validates :state, inclusion: { in: %w(in\ progress completed shipped) }
  before_save :assign_total_price

  def add_book(book, quantity)
    item = order_items.find_by(book: book)
    if item
      item.update(quantity: item.quantity + quantity)
    else
      order_items.create(price: book.price, quantity: quantity, book: book)
    end
  end

  private

  def assign_total_price
    self.total_price = order_items.sum('price * quantity')
  end

end
