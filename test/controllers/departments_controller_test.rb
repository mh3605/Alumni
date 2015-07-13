require 'test_helper'

class DepartmentsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @department = departments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:departments)
  end

  test "should get new" do
    sign_in users(:user_admin)
    get :new
    assert_response :success
  end

  test "should create department" do
    sign_in users(:user_admin)
    assert_difference('Department.count') do
      post :create, department: { name: @department.name }
    end

    assert_redirected_to department_path(assigns(:department))
  end

  test "should show department" do
    get :show, id: @department
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:user_admin)
    get :edit, id: @department
    assert_response :success
  end

  test "should update department" do
    sign_in users(:user_admin)
    patch :update, id: @department, department: { name: @department.name }
    assert_redirected_to department_path(assigns(:department))
  end

  test "should destroy department" do
    sign_in users(:user_admin)
    assert_difference('Department.count', -1) do
      delete :destroy, id: @department
    end

    assert_redirected_to departments_path
  end
end
