class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate, :cpf, :address, :phone1, :phone2

  def attributes(*args)
    h = super(*args)
    h[:birthdate] = object.birthdate.to_time.strftime("%d/%m/%Y") unless object.birthdate.blank? #Formato ISO9001
    h
  end
end
