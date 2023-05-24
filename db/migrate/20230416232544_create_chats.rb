class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.integer :id_user
      t.integer :moderator_id

      t.timestamps
    end
  end
end
