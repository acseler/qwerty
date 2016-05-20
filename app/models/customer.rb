class Customer < ActiveRecord::Base
  has_many :orders
  has_many :ratings
  validates :email, :password, :first_name, :last_name, presence: true
  validates :email, uniqueness: true
  # validates :email, format: { with: /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/ }
end
