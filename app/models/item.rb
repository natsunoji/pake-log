class Item < ApplicationRecord
  belongs_to :user
  # optional: true をつけることで、カテゴリ未選択でも保存できるようにする（任意項目のため）
  belongs_to :category, optional: true

  has_many :item_images, dependent: :destroy

  accepts_nested_attributes_for :item_images, allow_destroy: true

  validates :name, presence: true, length: { maximum: 40 }
  validates :name, uniqueness: { scope: :user_id }
  validates :memo, length: { maximum: 255 }

  # 画像枚数のカスタムバリデーション
  validate :item_images_count

  private

  def item_images_count
    # size だと保存前の枚数を正しく数えられない場合があるため、指定を少し調整
    if item_images.target.size > 3
      errors.add(:item_images, "は最大3枚までです")
    end
  end
end
