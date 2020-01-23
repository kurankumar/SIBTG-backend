require 'test_helper'

class WishlistsControllerTest < ActionDispatch::IntegrationTest
  test "should get add_game" do
    get wishlists_add_game_url
    assert_response :success
  end

end
