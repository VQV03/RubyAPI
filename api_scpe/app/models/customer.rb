class Customer < ApplicationRecord
  validates :name, :email, :birthdate, :cpf, :address, :phone1, presence: true
end
