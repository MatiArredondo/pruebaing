class AddUserIdToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :id_user, :integer
  end
end
