class ClientSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :date_of_birth, :phone_number
end
