class Category < ApplicationRecord
  # ranked-modelの機能を読み込む
  include RankedModel
  # row_orderカラムを使用して並び順を管理。user_idごとに順序を独立させる
  ranks :row_order, with_same: :user_id

  belongs_to :user
  has_many :items, dependent: :nullify

  validates :name, presence: true, length: { maximum: 20 }
  validates :name, uniqueness: { scope: :user_id }
end
