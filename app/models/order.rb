class Order < ApplicationRecord
  validates :id_product, presence: true
  validates :order_date, presence: true
  validates :status, presence: true
  validates :id_user, presence: true


  """
colocar validate
"""
end
