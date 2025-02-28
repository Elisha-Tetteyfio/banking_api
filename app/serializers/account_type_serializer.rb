class AccountTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :alias, :description
end
