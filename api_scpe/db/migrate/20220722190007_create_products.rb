class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :quantity_in_stock
      t.float :price
      t.boolean :highlight
      t.string :image

      t.timestamps
    end
  end
end
