require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get Pages" do
    get static_Pages_url
    assert_response :success
  end

  test "should get about" do
    get static_about_url
    assert_response :success
  end

  test "should get home" do
    get static_home_url
    assert_response :success
  end

  test "should get contact" do
    get static_contact_url
    assert_response :success
  end

end
