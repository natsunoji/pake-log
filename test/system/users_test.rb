require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "新規登録ができること" do
    visit new_user_registration_path

    fill_in "お名前", with: "テストユーザー"
    fill_in "メールアドレス", with: "new_tester@example.com"
    fill_in "パスワード（6文字以上）", with: "password"
    fill_in "パスワード（確認用）", with: "password"

    click_on "登録する"

    assert_text "テストユーザー さん"
  end

  test "ログインができること" do
    visit new_user_session_path

    # fixtures/users.yml に test@example.com が定義されている前提
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "パスワード", with: "password"

    click_on "ログイン"

    assert_text " さん"
  end
end
