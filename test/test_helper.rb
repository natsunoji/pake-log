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
