class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.integer :id_product
      t.text :status
      t.text :description
      t.date :order_date

      t.timestamps
    end
  end
end
