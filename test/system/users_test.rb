require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "新規登録ができること" do
    visit new_user_registration_path

    fill_in "お名前", with: "テストユーザー"
    fill_in "メールアドレス", with: "new_tester@example.com"
    fill_in "パスワード（6文字以上）", with: "password"
    fill_in "パスワード（確認用）", with: "password"

    find('input[type="submit"]', wait: 5).click

    assert_text "テストユーザー さん"
  end

  test "ログインができること" do
    # ...ここは今のままでOK...
    visit new_user_session_path
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "パスワード", with: "password"
    click_on "ログイン"
    assert_text " さん"
  end
end
