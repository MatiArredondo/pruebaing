class AddIdChatToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :id_chat, :integer
  end
end
