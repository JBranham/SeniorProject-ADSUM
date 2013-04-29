require 'test_helper'

class LectureDaysControllerTest < ActionController::TestCase
  setup do
    @lecture_day = lecture_days(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lecture_days)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lecture_day" do
    assert_difference('LectureDay.count') do
      post :create, lecture_day: { course_id: @lecture_day.course_id, friday: @lecture_day.friday, monday: @lecture_day.monday, saturday: @lecture_day.saturday, sunday: @lecture_day.sunday, thursday: @lecture_day.thursday, tuesday: @lecture_day.tuesday, wednesday: @lecture_day.wednesday }
    end

    assert_redirected_to lecture_day_path(assigns(:lecture_day))
  end

  test "should show lecture_day" do
    get :show, id: @lecture_day
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lecture_day
    assert_response :success
  end

  test "should update lecture_day" do
    put :update, id: @lecture_day, lecture_day: { course_id: @lecture_day.course_id, friday: @lecture_day.friday, monday: @lecture_day.monday, saturday: @lecture_day.saturday, sunday: @lecture_day.sunday, thursday: @lecture_day.thursday, tuesday: @lecture_day.tuesday, wednesday: @lecture_day.wednesday }
    assert_redirected_to lecture_day_path(assigns(:lecture_day))
  end

  test "should destroy lecture_day" do
    assert_difference('LectureDay.count', -1) do
      delete :destroy, id: @lecture_day
    end

    assert_redirected_to lecture_days_path
  end
end
