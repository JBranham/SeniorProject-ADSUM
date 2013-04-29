require 'test_helper'

class PassDPointsControllerTest < ActionController::TestCase
  setup do
    @pass_d_point = pass_d_points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pass_d_points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pass_d_point" do
    assert_difference('PassDPoint.count') do
      post :create, pass_d_point: { course_id: @pass_d_point.course_id, descr: @pass_d_point.descr, designated_point_id: @pass_d_point.designated_point_id, student_id: @pass_d_point.student_id }
    end

    assert_redirected_to pass_d_point_path(assigns(:pass_d_point))
  end

  test "should show pass_d_point" do
    get :show, id: @pass_d_point
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pass_d_point
    assert_response :success
  end

  test "should update pass_d_point" do
    put :update, id: @pass_d_point, pass_d_point: { course_id: @pass_d_point.course_id, descr: @pass_d_point.descr, designated_point_id: @pass_d_point.designated_point_id, student_id: @pass_d_point.student_id }
    assert_redirected_to pass_d_point_path(assigns(:pass_d_point))
  end

  test "should destroy pass_d_point" do
    assert_difference('PassDPoint.count', -1) do
      delete :destroy, id: @pass_d_point
    end

    assert_redirected_to pass_d_points_path
  end
end
