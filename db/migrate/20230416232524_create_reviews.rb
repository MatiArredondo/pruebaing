class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.float :grade
      t.integer :id_user

      t.timestamps
    end
  end
end
