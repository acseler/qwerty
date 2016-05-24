class Rating < ActiveRecord::Base
  belongs_to :customer
  belongs_to :book

  validates :review, :rating, presence: true
  validates :rating, inclusion: { in: 1..10 }

end
