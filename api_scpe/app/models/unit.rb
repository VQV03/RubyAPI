class Unit < ApplicationRecord
  validates :name, presence: true

  has_one :product
  accepts_nested_attributes_for :product, allow_destroy: true
end
