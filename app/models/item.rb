class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :item_images, dependent: :destroy

  validates :name, presence: true, length: { maximum: 40 }
  validates :name, uniqueness: { scope: :user_id }
  validates :memo, length: { maximum: 255 }

  # 画像枚数のカスタムバリデーション
  validate :item_images_count

  private

  def item_images_count
    if item_images.size > 3
      errors.add(:item_images, "は最大3枚までです")
    end
  end
end
