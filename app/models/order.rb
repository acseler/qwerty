class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :credit_card
end
