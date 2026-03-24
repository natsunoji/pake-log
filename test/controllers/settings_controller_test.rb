require "test_helper"

class SettingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    # 🌟 フィクスチャを使わず、直接ユーザーを作成する
    @user = User.find_or_create_by!(email: "test@pake-log.com") do |u|
      u.name = "テストユーザー"
      u.password = "password123"
    end
  end

  test "should get index" do
    sign_in @user
    get settings_url
    assert_response :success
  end
end
