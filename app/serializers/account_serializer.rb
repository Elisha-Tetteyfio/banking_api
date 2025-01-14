class AccountSerializer < ActiveModel::Serializer
  attributes :id, :account_number, :balance
  has_one :client
end
