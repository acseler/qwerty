class Customer < ActiveRecord::Base
  IN_PROGRESS = 'in progress'
  has_many :orders
  has_many :ratings
  validates :email, :password, :first_name, :last_name, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i }

  def new_order(**params)
    orders.create(params)
  end

  def current_order
    orders.find_by_state(IN_PROGRESS)
  end

end
