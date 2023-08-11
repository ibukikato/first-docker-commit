class Fragrance < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :image
  end
  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
end
