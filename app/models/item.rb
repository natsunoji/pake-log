class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true

  # 添付ファイルの設定
  has_many_attached :images

  # 基本バリデーション
  validates :name, presence: true, length: { maximum: 40 }
  validates :name, uniqueness: { scope: :user_id }
  validates :memo, length: { maximum: 255 }

  # 🌟 画像のバリデーション（新規・編集共通）
  validate :images_presence_and_count

  def cover_image
    images.first
  end

  def remaining_images
    images.offset(1)
  end

  # Ransack用設定
  def self.ransackable_attributes(auth_object = nil)
    [ "name", "category_id", "created_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "category", "images_attachments", "images_blobs" ]
  end

  private

  def images_presence_and_count
    if images.attached?
      if images.count > 3
        errors.add(:images, "は最大3枚までです。")
      end
    else
      errors.add(:images, "を1枚以上選択してください。")
    end
  end
end
