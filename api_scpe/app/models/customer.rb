class Customer < ApplicationRecord
  validates :name, :email, :birthdate, :cpf, :address, presence: true

  has_many :phones
  accepts_nested_attributes_for :phones, allow_destroy: true

  def as_json(options = {})
    h = super(options)
    h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
    return h
  end
end
