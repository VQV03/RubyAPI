class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate, :cpf, :address

  has_many :phones, optional: true

  def attributes(*args)
    h = super(*args)
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank? #Formato ISO8601
    h
  end
end
