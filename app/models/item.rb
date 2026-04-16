class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true

  # 添付ファイルの設定
  has_many_attached :images
  has_many :favorites, dependent: :destroy
  has_many :favorited_by, through: :favorites, source: :user

  # 基本バリデーション
  validates :name, presence: true, length: { maximum: 40 }
  validates :name, uniqueness: { scope: :user_id }
  validates :memo, length: { maximum: 255 }

  # 🌟 画像のバリデーション（新規・編集共通）
  validate :images_presence_and_count
  validate :validate_images_format

  def cover_image
    images.first
  end

  def remaining_images
    images.offset(1)
  end

  # 🌟 Ransack用にお気に入り絞り込みのスコープを追加
  def self.ransackable_scopes(auth_object = nil)
    %w[favorited_by]
  end

  # 修正：引数 user_id をより確実に数値化して受ける
  def self.favorited_by(user_id = nil)
    # user_id が nil や空文字なら全件。
    # 0 は除外（current_user.id は必ず 1 以上のため）
    u_id = user_id.to_i
    return all if u_id <= 0

    joins(:favorites).where(favorites: { user_id: u_id })
  end

  # Ransack用設定
  def self.ransackable_attributes(auth_object = nil)
    [ "name", "category_id", "memo", "created_at" ]
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

  def validate_images_format
    return unless images.attached?

    images.each do |image|
      # image/gif が含まれていたらエラーを追加する
      if image.content_type == "image/gif"
        errors.add(:images, "にGIF形式は使用できません。JPEGまたはPNG形式を選択してください")
      end
    end
  end
end
