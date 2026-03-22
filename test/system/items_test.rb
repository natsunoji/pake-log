require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:standard_user)
    sign_in @user
  end

  test "画像を添付してパケを登録し、完了画面が表示されること" do
    visit new_item_url

    fill_in "パケの名前", with: "テストのパケ"

    # 【最終手段】
    # 第一引数は確実にID（item_image_input）を指定。
    # visible: false をつけることで、CSSで隠れていても強制的に見つけ出します。
    attach_file "item_image_input",
                Rails.root.join("test/fixtures/files/test_image.png"),
                visible: false

    click_on "この内容で登録する"

    assert_text "おつかれさまでした"
    assert_text "心が軽くなりましたね"
  end

  test "名前が空の場合、エラーメッセージが出て画像プレビューが残ること" do
    visit new_item_url

    # こちらも同様にID + visible: false
    attach_file "item_image_input",
                Rails.root.join("test/fixtures/files/test_image.png"),
                visible: false

    click_on "この内容で登録する"

    assert_text "名前を入力してください"
    # プレビュー画像が表示されているか確認
    assert_selector "img[data-input-images-target='image']", visible: true
  end
end
