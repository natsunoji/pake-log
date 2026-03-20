require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module PakeLog
  class Application < Rails::Application
    config.load_defaults 7.2

    config.autoload_lib(ignore: %w[assets tasks])

    # デフォルトの言語を日本語に設定
    config.i18n.default_locale = :ja
  end
end
