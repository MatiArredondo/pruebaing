class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :cellphone, :string
    add_column :users, :description, :text
    add_column :users, :image_path, :string
  end
end
