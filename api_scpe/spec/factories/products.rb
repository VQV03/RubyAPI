FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    quantity_in_stock { Random.rand(1..99) }
    price { Faker::Commerce.price }
    highligth { Faker::Boolean.boolean(true_ratio: 0.5) }
    
    category { Category.all.sample }
    unit { Unit.all.sample }
  end
end