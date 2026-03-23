class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true

  # 💡 修正ポイント：
  # block（do...end）を削除し、純粋に添付ファイルがあることだけを定義します。
  # 以前書いていた variant の設定は、すべて View 側の cl_image_tag に移行したので、ここでは不要です。
  has_many_attached :images

  validates :name, presence: true, length: { maximum: 40 }
  validates :name, uniqueness: { scope: :user_id }
  validates :memo, length: { maximum: 255 }

  validate :images_presence_and_count

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
    [ "category", "images_attachments", "images_blobs" ]
  end

  private

  def images_presence_and_count
    if images.attached?
      if images.count > 3
        errors.add(:base, "画像は最大3枚までです。")
      end
    else
      errors.add(:base, "画像を1枚以上選択してください。")
    end
  end
end
