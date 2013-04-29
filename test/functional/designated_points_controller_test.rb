require 'test_helper'

class DesignatedPointsControllerTest < ActionController::TestCase
  setup do
    @designated_point = designated_points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:designated_points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create designated_point" do
    assert_difference('DesignatedPoint.count') do
      post :create, designated_point: { course_id: @designated_point.course_id, name: @designated_point.name, num: @designated_point.num }
    end

    assert_redirected_to designated_point_path(assigns(:designated_point))
  end

  test "should show designated_point" do
    get :show, id: @designated_point
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @designated_point
    assert_response :success
  end

  test "should update designated_point" do
    put :update, id: @designated_point, designated_point: { course_id: @designated_point.course_id, name: @designated_point.name, num: @designated_point.num }
    assert_redirected_to designated_point_path(assigns(:designated_point))
  end

  test "should destroy designated_point" do
    assert_difference('DesignatedPoint.count', -1) do
      delete :destroy, id: @designated_point
    end

    assert_redirected_to designated_points_path
  end
end
