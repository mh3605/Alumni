require 'test_helper'

class ResearchareasControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @researcharea = researchareas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:researchareas)
  end

  test "should get new" do
    sign_in users(:user_admin)
    get :new
    assert_response :success
  end

  test "should create researcharea" do
    sign_in users(:user_admin)
    assert_difference('Researcharea.count') do
      post :create, researcharea: { name: @researcharea.name }
    end

    assert_redirected_to researcharea_path(assigns(:researcharea))
  end

  test "should show researcharea" do
    get :show, id: @researcharea
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:user_admin)
    get :edit, id: @researcharea
    assert_response :success
  end

  test "should update researcharea" do
    sign_in users(:user_admin)
    patch :update, id: @researcharea, researcharea: { name: @researcharea.name }
    assert_redirected_to researcharea_path(assigns(:researcharea))
  end

  test "should destroy researcharea" do
    sign_in users(:user_admin)
    assert_difference('Researcharea.count', -1) do
      delete :destroy, id: @researcharea
    end

    assert_redirected_to researchareas_path
  end
end
