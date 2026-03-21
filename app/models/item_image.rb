class ItemImage < ApplicationRecord
  belongs_to :item

  has_one_attached :image

  validates :image, presence: true
end
