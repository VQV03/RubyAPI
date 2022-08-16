class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.date :birthdate
      t.string :cpf
      t.string :address
      t.string :phone1
      t.string :phone2

      t.timestamps
    end
  end
end
