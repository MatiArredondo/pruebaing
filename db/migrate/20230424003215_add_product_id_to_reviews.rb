class AddProductIdToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :id_product, :integer
  end
end
