class Product < ApplicationRecord
  validates :name, :price, presence: true
  belongs_to :shop, dependent: :destroy
  has_many :product_fields, through: :shop
end
