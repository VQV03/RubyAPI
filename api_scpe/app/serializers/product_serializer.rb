class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :quantity_in_stock, :price, :highlight
  
  belongs_to :category, optional: true
  belongs_to :unit, optional: true
end
