require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_index_url
    assert_response :success
  end

  test "should get top_contributors" do
    get users_top_contributors_url
    assert_response :success
  end

end
