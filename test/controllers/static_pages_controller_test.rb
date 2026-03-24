require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get terms" do
    # 🌟 static_pages_terms_url から terms_url に修正
    get terms_url
    assert_response :success
  end

  test "should get privacy" do
    # 🌟 static_pages_privacy_url から privacy_url に修正
    get privacy_url
    assert_response :success
  end

  test "should get contact" do
    # 🌟 もし contact のテストもあれば、ここも contact_url に修正
    get contact_url
    assert_response :success
  end
end
