require 'test_helper'

class FacultiesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @faculty = faculties(:jeff_foster)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:faculties)
  end

  test "should get new" do
    sign_in users(:user_admin)
    get :new
    assert_response :success
  end

  test "should create faculty" do
    sign_in users(:user_admin)
    assert_difference('Faculty.count') do
      post :create, faculty: { about: @faculty.about, email: @faculty.email, name: @faculty.name}
    end

    assert_redirected_to faculty_path(assigns(:faculty))
  end

  test "should show faculty" do
    get :show, id: @faculty
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:user_admin)
    get :edit, id: @faculty
    assert_response :success
  end

  test "should update faculty" do
    sign_in users(:user_admin)
    patch :update, id: @faculty, faculty: { about: @faculty.about, email: @faculty.email, name: @faculty.name}
    assert_redirected_to faculty_path(assigns(:faculty))
  end

  test "should destroy faculty" do
    sign_in users(:user_admin)
    assert_difference('Faculty.count', -1) do
      delete :destroy, id: @faculty
    end

    assert_redirected_to faculties_path
  end
end
