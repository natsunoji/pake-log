require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "新規登録ができること" do
    visit new_user_registration_path

    fill_in "お名前", with: "テストユーザー"
    # 毎回違うメールアドレスにするため、タイムスタンプを付与します
    fill_in "メールアドレス", with: "new_tester_#{Time.now.to_i}@example.com"

    # 修正：ラベルの曖昧さを回避するため match: :first を活用
    fill_in "パスワード", with: "password", match: :first
    fill_in "パスワード（確認用）", with: "password", match: :first

    # 【ここが重要！】
    # 「アカウント登録」という文字が見つからないエラーを回避するため、
    # 送信ボタン（input type="submit"）を直接探してクリックします。
    find('input[type="submit"]').click

    # 登録完了後の表示を確認
    assert_text "テストユーザー さん"
  end

  test "ログインができること" do
    @user = users(:standard_user)
    visit new_user_session_path
    fill_in "メールアドレス", with: @user.email
    fill_in "パスワード", with: "password"

    # ログインボタンも同様に type="submit" で確実に押す
    find('input[type="submit"]').click

    assert_text "#{@user.name} さん"
  end
end
