class Menu < ApplicationRecord
  belongs_to :category
  has_many :order_details
  has_many :orders, through: :order_details
  validates :price, comparison: { greater_than_or_equal_to: 0.01 }
  validates :description, length: {maximum: 150}
end
