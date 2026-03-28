require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # 既存の driven_by を消して、以下に置き換え
  driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ] do |options|
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")
    options.add_argument("--disable-gpu")
  end
end
