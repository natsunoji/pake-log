class User < ApplicationRecord
  has_secure_password

  has_many :categories, dependent: :destroy
  has_many :items, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true

  # ユーザー登録直後にデフォルトカテゴリを作成する
  after_create :create_default_categories

  private

  def create_default_categories
    [ "家電", "食品", "交通", "くすり", "日用品", "その他" ].each do |category_name|
      categories.create!(name: category_name)
    end
  end
end
