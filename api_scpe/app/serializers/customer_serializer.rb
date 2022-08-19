class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate, :cpf, :address, :phone1, :phone2

  def attributes(*args)
    h = super(*args)
    h[:birthdate] = object.birthdate.to_time.strftime("%Y-%m-%d") unless object.birthdate.blank?   #.strftime("%d/%m/%Y") #Formato ISO9001
    h
  end
end
