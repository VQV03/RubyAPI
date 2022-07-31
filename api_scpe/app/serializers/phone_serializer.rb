class PhoneSerializer < ActiveModel::Serializer
  attributes :id, :phone
  
  belongs_to :customer, optional: true
end
