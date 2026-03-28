require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    # users.yml で定義した 'standard_user' を使う
    @user = users(:standard_user)
    sign_in @user
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get new" do
    get new_item_url
    assert_response :success
  end

  test "should create item" do
    assert_difference("Item.count", 1) do
      post items_url, params: {
        item: {
          name: "新規パケ登録テスト",
          # 修正：Active Storage の場合は attributes ではなく直接 images を渡します
          images: [ fixture_file_upload("test/fixtures/files/test_image.png", "image/png") ]
        }
      }
    end
    assert_redirected_to item_url(Item.last)
  end

  test "他人のアイテム詳細画面にアクセスしようとすると一覧にリダイレクトされること" do
    # 1. 他のユーザー(other_user)のアイテムを用意
    # ※ items.yml で user: other_user となっているデータを使います
    @other_item = items(:other_item)

    # 2. ログイン中の自分(@user)が、他人のアイテムを見ようとする
    get item_url(@other_item)

    # 3. 拒否されて一覧ページへ戻されることを確認
    assert_redirected_to items_url
    assert_equal "指定されたアイテムが見つかりません、または権限がありません。", flash[:alert]
  end

  test "他人のアイテムを削除しようとしても削除されず一覧にリダイレクトされること" do
    @other_item = items(:other_item)

    # 1. 削除を実行しても、Itemの総数が変わらないことを確認
    assert_no_difference("Item.count") do
      delete item_url(@other_item)
    end

    # 2. 拒否されてリダイレクトされることを確認
    assert_redirected_to items_url
  end
end
