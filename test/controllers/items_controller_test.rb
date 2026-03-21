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
    assert_difference("Item.count") do
      post items_url, params: {
        item: {
          name: "新規パケ登録テスト",
          item_images_attributes: [
            { image: fixture_file_upload("test/fixtures/files/test_image.png", "image/png") }
          ]
        }
      }
    end
    assert_redirected_to items_url
  end
end
