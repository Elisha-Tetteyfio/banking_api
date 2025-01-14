class Client < ApplicationRecord
  belongs_to :user
  has_one :account

  validates :first_name, presence: true
  validates :phone_number, presence: true, uniqueness: true
end
