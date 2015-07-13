require 'test_helper'

class AlumsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @alum = alums(:andrew)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alums)
  end

  test "should get new" do
    sign_in users(:user_admin)
    get :new
    assert_response :success
  end

  test "should create alum" do
    sign_in users(:user_admin)
    assert_difference('Alum.count') do
      post :create, alum: { about: @alum.about, email: @alum.email, name: @alum.name, phone: @alum.phone }
    end

    assert_redirected_to alum_path(assigns(:alum))
  end

  test "should show alum" do
    get :show, id: @alum
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:user_admin)
    get :edit, id: @alum
    assert_response :success
  end

  test "should update alum" do
    sign_in users(:user_admin)
    patch :update, id: @alum, alum: { about: @alum.about, email: @alum.email, name: @alum.name, phone: @alum.phone }
    assert_redirected_to alum_path(assigns(:alum))
  end

  test "should destroy alum" do
    sign_in users(:user_admin)
    assert_difference('Alum.count', -1) do
      delete :destroy, id: @alum
    end

    assert_redirected_to alums_path
  end
end
