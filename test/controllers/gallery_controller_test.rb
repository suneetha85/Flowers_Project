require 'test_helper'

class GalleryControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get checkout" do
    get :checkout
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

end
