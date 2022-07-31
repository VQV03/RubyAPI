namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts "Resetando o banco de dados"
    %x(rails db:drop db:create db:migrate)
    puts "Banco de dados resetado com sucesso"

#########################################################################

    puts "Cadastrando as categorias"

    categories = %w(Hardware Perifericos Computadores Celulares TV)

    categories.each do |category|
      Category.create!(
        name: category
      )
    end

    puts "Categorias cadastradas com sucesso"

#########################################################################

    puts "Cadastrando as unidade"

    units = %w(Unidade Pacote Caixa)

    units.each do |unit|
      Unit.create!(
        name: unit
      )
    end

    puts "Unidades cadastradas com sucesso"

#########################################################################

    puts "Cadastrando os Produtos"

    puts Faker::Boolean.boolean
    # @boolean = [true, false]
    

    100.times do |i|

      # @random = @boolean.sample

      Product.create!(
        name: Faker::Commerce.product_name,
        description: Faker::Lorem.paragraph,
        quantity_in_stock: Random.rand(1..99),
        price: Faker::Commerce.price,
        highlight: Faker::Boolean.boolean,
        category: Category.all.sample,
        unit: Unit.all.sample
      )
    end

    puts "Produtos cadastrados com sucesso"

#########################################################################

    puts "Adicionando clientes"

    50.times do |i|
      Customer.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        cpf: Faker::IDNumber.brazilian_citizen_number(formatted: true),
        address: Faker::Address.full_address
      )
    end

    puts "Clientes cadastrados com sucesso"

#########################################################################

    puts "Cadastrando telefones"

    Customer.all.each do |customer|
      Random.rand(1..5).times do |i|
        phone = Phone.create!(phone: Faker::PhoneNumber.cell_phone, customer_id: customer.id)
        customer.phones << phone
        customer.save!
      end
    end

    puts "Telefones cadastrados com sucesso"
  end
end
