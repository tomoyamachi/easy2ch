require 'test_helper'

class PostControllerTest < ActionController::TestCase
  test "should get name:string" do
    get :name:string
    assert_response :success
  end

  test "should get comment:text" do
    get :comment:text
    assert_response :success
  end

  test "should get category:string" do
    get :category:string
    assert_response :success
  end

end
