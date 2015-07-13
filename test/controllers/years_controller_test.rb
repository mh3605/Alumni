require 'test_helper'

class YearsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @year = years(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:years)
  end

  test "should get new" do
    sign_in users(:user_admin)
    get :new
    assert_response :success
  end

  test "should create year" do
    sign_in users(:user_admin)
    assert_difference('Year.count') do
      post :create, year: { yr: @year.yr }
    end

    assert_redirected_to year_path(assigns(:year))
  end

  test "should show year" do
    get :show, id: @year
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:user_admin)
    get :edit, id: @year
    assert_response :success
  end

  test "should update year" do
    sign_in users(:user_admin)
    patch :update, id: @year, year: { yr: @year.yr }
    assert_redirected_to year_path(assigns(:year))
  end

  test "should destroy year" do
    sign_in users(:user_admin)
    assert_difference('Year.count', -1) do
      delete :destroy, id: @year
    end

    assert_redirected_to years_path
  end
end
