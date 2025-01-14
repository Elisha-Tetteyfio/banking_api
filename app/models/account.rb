class Account < ApplicationRecord
  belongs_to :user
  belongs_to :client
  belongs_to :account_type

  before_create :generate_account_number

  private

  def generate_account_number
    self.account_number = "ACT" + SecureRandom.random_number(10**8).to_s.rjust(8, '0')

    # Ensure uniqueness
    loop do
      break unless Account.exists?(account_number: self.account_number)
      self.account_number = "ACT" + SecureRandom.random_number(10**8).to_s.rjust(8, '0')
    end
  end
end
