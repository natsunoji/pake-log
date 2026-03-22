class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true

  has_many_attached :images

  validates :name, presence: true, length: { maximum: 40 }
  validates :name, uniqueness: { scope: :user_id }
  validates :memo, length: { maximum: 255 }

  validate :images_count_within_limit

  def cover_image
    images.first
  end

  def remaining_images
    images.offset(1)
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "name", "category_id", "created_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "category", "images_attachments", "images_blobs" ] # ransack用も更新
  end

  private

  def images_count_within_limit
    if images.attached?
      errors.add(:base, "画像は最大3枚までです。") if images.count > 3
    else
      errors.add(:base, "画像を1枚以上選択してください。")
    end
  end
end
