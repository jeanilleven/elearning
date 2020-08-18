require 'test_helper'

class Admin::WordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_words_index_url
    assert_response :success
  end

end
