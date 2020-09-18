class Shop < ApplicationRecord
  validates :name, presence: true
  has_many :custom_fields, dependent: :delete_all
  has_many :products, dependent: :delete_all

#  has_many :product_fields, dependent: :delete_all
end
