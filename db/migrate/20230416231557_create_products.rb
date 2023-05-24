class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.text :name
      t.integer :price
      t.string :image
      t.integer :id_user

      t.timestamps
    end
  end
end
