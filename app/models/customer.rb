class Customer < ApplicationRecord
  validates :email, presence:true, uniqueness:true, 'valid_email_2/email': true
  has_many :orders
end
