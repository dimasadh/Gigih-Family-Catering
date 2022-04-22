class Customer < ApplicationRecord
  validates :email, presence:true, uniqueness:true, 'valid_email_2/email': true
  has_many :orders

  def self.find_by_email(email)
    where("email = ?", email).first
  end
end
