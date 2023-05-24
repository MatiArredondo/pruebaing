class Product < ApplicationRecord
	has_one_attached :image
  has_many :review, dependent: :destroy
  has_one :order
  has_one :user, through: :order
  validates :name, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :id_user, presence: true
end
