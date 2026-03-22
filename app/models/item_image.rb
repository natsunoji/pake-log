class ItemImage < ApplicationRecord
  belongs_to :item

  has_one_attached :image

  validates :image, presence: true

  # 引数 resize_limit でサイズを指定できるように変更。デフォルトは [400, 400]
  def display_image(resize_limit = [ 400, 400 ])
    if image.variable?
      # resize_to_limit を追加することで、指定サイズに収まるようリサイズしつつメタデータを削除
      image.variant(resize_to_limit: resize_limit, saver: { strip: true }).processed
    else
      image
    end
  end
end
