class Phone < ApplicationRecord
  validates :phone, presence: true

  belongs_to :customer, optional: true
end
