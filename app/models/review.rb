class Review < ApplicationRecord
  validates :id_user, presence: true
  validates :id_product, presence: true
  validates :content, presence: true
  validates :grade, presence: true

end
