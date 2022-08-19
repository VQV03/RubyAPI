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
    
    images = ["https://a-static.mlcdn.com.br/280x210/iphone-11-apple-128gb-branco-61-12mp-ios/magazineluiza/155611200/af1cd7d9c89d7306b52490a0ce1b8b34.jpg", "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Desktop_computer_clipart_-_Yellow_theme.svg/260px-Desktop_computer_clipart_-_Yellow_theme.svg.png", "https://www.jbl.com.br/on/demandware.static/-/Sites-JB-BR-Library/default/dw1a812092/glp/fones-de-ouvido/images/cat-02.png", "https://www.notebookcheck.info/uploads/tx_nbc2/SL4_AMD_1.jpg", "https://a-static.mlcdn.com.br/1500x1500/smartphone-samsung-galaxy-a22-128gb-branco-4g-4gb-ram-tela-64-cam-quadrupla-selfie-13mp/magazineluiza/231143800/78765d6cd40d05a820e8ff663a29bc20.jpg", "https://i.dell.com/is/image/DellContent//content/dam/ss2/product-images/peripherals/input-devices/dell/keyboards/aw510k/gray/ng/keyboard-alienware-aw510k-campaign-hero-504x350-ng.psd?fmt=jpg", "https://images.kabum.com.br/produtos/fotos/104147/mouse-gamer-razer-viper-16-000-dpi_mouse-gamer-razer-viper-16-000-dpi_1569433267_gg.jpg", "https://www.lg.com/br/images/monitores/md07542961/gallery/Dm-02.jpg"]

    100.times do |i|
      Product.create!(
        name: Faker::Commerce.product_name,
        description: Faker::Lorem.paragraph,
        quantity_in_stock: Random.rand(1..99),
        price: Faker::Commerce.price,
        highlight: Faker::Boolean.boolean,
        category: Category.all.sample,
        unit: Unit.all.sample,
        image: images.sample
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
        address: Faker::Address.full_address,
        phone1: Faker::PhoneNumber.cell_phone,
        phone2: Faker::PhoneNumber.cell_phone
      )
    end

    puts "Clientes cadastrados com sucesso"
  end
end
