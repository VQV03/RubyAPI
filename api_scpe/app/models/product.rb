class Product < ApplicationRecord
  # validates_presence_of :category
  # validates_presence_of :unit

  validates :name, :description, :quantity_in_stock, :price, presence: true

  belongs_to :category, optional: true
  belongs_to :unit, optional: true
end
