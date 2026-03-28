require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "新規登録ができること" do
    visit new_user_registration_path

    fill_in "ユーザーネーム", with: "テストユーザー"
    # 衝突を避けるためのタイムスタンプ付与
    fill_in "メールアドレス", with: "new_tester_#{Time.now.to_i}@example.com"

    # ラベルを正確に指定（プレースホルダーや曖昧な一致を避ける）
    fill_in "パスワード（6文字以上）", with: "password"
    fill_in "パスワード（確認用）", with: "password"

    # 🌟 【ここが最重要】チェックボックスにチェックを入れる
    # ページ内の「利用規約」というテキストを含むチェックボックスを探してチェック
    find('input[type="checkbox"]').set(true)

    # 送信ボタンをクリック
    find('input[type="submit"]').click

    # 登録完了後の表示を確認
    assert_text "テストユーザー さん"
  end

  test "ログインができること" do
    # 以前のエラー（SettingsController）と同様、Fixturesがなければ直接作成
    @user = User.find_or_create_by!(email: "login_test@example.com") do |u|
      u.name = "ログインテスト"
      u.password = "password"
    end

    visit new_user_session_path
    fill_in "メールアドレス", with: @user.email
    fill_in "パスワード", with: "password"

    find('input[type="submit"]').click

    assert_text "#{@user.name} さん"
  end
end
