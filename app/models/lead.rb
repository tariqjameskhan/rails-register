class Lead < ApplicationRecord
  validates :name, presence: true
  validates :email_address, presence: true
  validates :telephone_number, presence: true
end
