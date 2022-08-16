class AuthsSerializer < ActiveModel::Serializer
  attributes :token
  def attributes
    hash = super
    hash.each {|key, value|
      if value.nil?
        hash.delete(key)
      end
  }
    hash
  end
end