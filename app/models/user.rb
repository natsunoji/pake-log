class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  # has_secure_password - deviceと役割が重複するので削除

  has_many :categories, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_items, through: :favorites, source: :item

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true

  # ユーザー登録直後にデフォルトカテゴリを作成する
  after_create :create_default_categories

  def favorited?(item)
    favorites.exists?(item_id: item.id)
  end

  private

  def create_default_categories
    [ "家電", "食品", "交通", "くすり", "日用品", "その他" ].each do |category_name|
      categories.create!(name: category_name)
    end
  end
end
