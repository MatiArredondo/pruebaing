class Message < ApplicationRecord
  validates :content, presence: true
  validates :id_chat, presence: true
  validates :id_user, presence: true
end
