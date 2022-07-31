FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    birthdate { Faker::Date.between(from: 65.years.ago, to: 18.years.ago) }
    cpf { Faker::IDNumber.brazilian_citizen_number(formatted: true) }
    address { Faker::Address.full_address }
    
    phone { Faker::PhoneNumber.phone_number }
  end
end