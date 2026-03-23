require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:standard_user)
    sign_in @user
  end

  test "画像を添付してパケを登録し、詳細画面が表示されること" do
    visit new_item_url

    fill_in "パケの名前", with: "テストのパケ"

    # 画像を添付
    attach_file "item_image_input",
                Rails.root.join("test/fixtures/files/test_image.png"),
                visible: false

    click_on "この内容で登録する"

    # 💡 修正ポイント：
    # 登録後は「完了画面」ではなく「詳細画面」に行くようになったので、
    # 詳細画面に存在するテキストを確認します。
    assert_text "登録しました"        # フラッシュメッセージ
    assert_text "説明書詳細"          # ヘッダータイトル
    assert_text "テストのパケ"        # 登録した名前
  end

  test "名前が空の場合、エラーメッセージが表示されること" do
    visit new_item_url

    attach_file "item_image_input",
                Rails.root.join("test/fixtures/files/test_image.png"),
                visible: false

    click_on "この内容で登録する"

    assert_text "名前を入力してください"
  end
end
