ENV["RAILS_ENV"] ||= "test"

# 💡 Cloudinaryの環境変数を先に設定
ENV["CLOUDINARY_CLOUD_NAME"] ||= "test_cloud"
ENV["CLOUDINARY_API_KEY"] ||= "test_key"
ENV["CLOUDINARY_API_SECRET"] ||= "test_secret"

require_relative "../config/environment"
require "rails/test_help"

# 💡 Cloudinaryの設定を明示的に行う
Cloudinary.config do |config|
  config.cloud_name = ENV["CLOUDINARY_CLOUD_NAME"]
  config.api_key = ENV["CLOUDINARY_API_KEY"]
  config.api_secret = ENV["CLOUDINARY_API_SECRET"]
  config.secure = true
end

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

# 💡 Cloudinary のモック化を追加
module CloudinaryTestHelper
  def stub_cloudinary_upload
    # 💡 元のメソッドを保存
    original_upload = Cloudinary::Uploader.method(:upload)

    # 💡 Cloudinary::Uploader.upload をモック化
    Cloudinary::Uploader.define_singleton_method(:upload) do |file, options = {}|
      {
        "public_id" => "test_image",
        "version" => 1234567890,
        "url" => "http://res.cloudinary.com/test_cloud/image/upload/v1234567890/test_image.jpg",
        "secure_url" => "https://res.cloudinary.com/test_cloud/image/upload/v1234567890/test_image.jpg"
      }
    end

    yield

  ensure
    # 💡 テスト後に元に戻す
    Cloudinary::Uploader.define_singleton_method(:upload, original_upload)
  end
end

# 💡 システムテストで Cloudinary のモック化を有効にする
class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include CloudinaryTestHelper
end
