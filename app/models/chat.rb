class Chat < ApplicationRecord
  validates :id_user, presence: true
  validates :moderator_id, presence: true
end
