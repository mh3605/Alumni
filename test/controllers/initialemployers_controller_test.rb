require 'test_helper'

class InitialemployersControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @initialemployer = initialemployers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:initialemployers)
  end

  test "should get new" do
    sign_in users(:user_admin)
    get :new
    assert_response :success
  end

  test "should create initialemployer" do
    sign_in users(:user_admin)
    assert_difference('Initialemployer.count') do
      post :create, initialemployer: { name: @initialemployer.name }
    end

    assert_redirected_to initialemployer_path(assigns(:initialemployer))
  end

  test "should show initialemployer" do
    get :show, id: @initialemployer
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:user_admin)
    get :edit, id: @initialemployer
    assert_response :success
  end

  test "should update initialemployer" do
    sign_in users(:user_admin)
    patch :update, id: @initialemployer, initialemployer: { name: @initialemployer.name }
    assert_redirected_to initialemployer_path(assigns(:initialemployer))
  end

  test "should destroy initialemployer" do
    sign_in users(:user_admin)
    assert_difference('Initialemployer.count', -1) do
      delete :destroy, id: @initialemployer
    end

    assert_redirected_to initialemployers_path
  end
end
