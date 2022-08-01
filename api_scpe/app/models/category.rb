class Category < ApplicationRecord
  validates :name, presence: true

  has_many :products
  accepts_nested_attributes_for :products, allow_destroy: true
end
