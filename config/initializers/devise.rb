# frozen_string_literal: true

Devise.setup do |config|
  # ==> Mailer Configuration
  # 🌟 ここを変更しました！
  # 表示名を「PakeLog」、アドレスを自分の好きなもの（例: natsunoji@gmail.com など）に変えられます。
  config.mailer_sender = "PakeLog <no-reply@pake-log.com>"

  # --- 以下、デフォルトの設定を維持しつつ整理した内容です ---

  require "devise/orm/active_record"

  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [ :http_auth ]
  config.stretches = Rails.env.test? ? 1 : 12
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = [ :get, :delete ]
  config.responder.error_status = :unprocessable_content
  config.responder.redirect_status = :see_other

  # もし将来的に独自のメーラークラスを使う場合はここをアンコメントします
  # config.mailer = 'Devise::Mailer'
end
