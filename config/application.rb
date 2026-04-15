require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module PakeLog
  class Application < Rails::Application
    config.load_defaults 7.2

    config.autoload_lib(ignore: %w[assets tasks])

    # デフォルトの言語を日本語に設定
    config.i18n.default_locale = :ja

    # Cloudinaryが提供する加工パラメータをActive Storageがそのまま通すようにする
    config.active_storage.track_variants = true

    # 日本標準時に設定
    config.time_zone = "Tokyo"
    # DBの保存時刻もJST（日本時間）に合わせる
    config.active_record.default_timezone = :local
  end
end
