ENV["RAILS_ENV"] ||= "test"

ENV["CLOUDINARY_CLOUD_NAME"] ||= "test_cloud"
ENV["CLOUDINARY_API_KEY"] ||= "test_key"
ENV["CLOUDINARY_API_SECRET"] ||= "test_secret"

require_relative "../config/environment"
require "rails/test_help"

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
    Cloudinary::Uploader.stub :upload, {
      'public_id' => 'test_image',
      'version' => 1234567890,
      'url' => 'http://res.cloudinary.com/test_cloud/image/upload/v1234567890/test_image.jpg',
      'secure_url' => 'https://res.cloudinary.com/test_cloud/image/upload/v1234567890/test_image.jpg'
    } do
      yield
    end
  end
end

# 💡 システムテストで Cloudinary のモック化を有効にする
class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include CloudinaryTestHelper
end