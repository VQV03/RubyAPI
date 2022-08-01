class UnitSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :products, optional: true
end
