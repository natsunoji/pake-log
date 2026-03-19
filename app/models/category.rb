class Category < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :restrict_with_error # アイテムがある場合消せない

  validates :name, presence: true, length: { maximum: 20 }
  # ユーザーごとに名前がユニークであること
  validates :name, uniqueness: { scope: :user_id }
end
