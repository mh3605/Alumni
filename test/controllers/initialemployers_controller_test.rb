require 'test_helper'

class InitialemployersControllerTest < ActionController::TestCase
  setup do
    @initialemployer = initialemployers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:initialemployers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create initialemployer" do
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
    get :edit, id: @initialemployer
    assert_response :success
  end

  test "should update initialemployer" do
    patch :update, id: @initialemployer, initialemployer: { name: @initialemployer.name }
    assert_redirected_to initialemployer_path(assigns(:initialemployer))
  end

  test "should destroy initialemployer" do
    assert_difference('Initialemployer.count', -1) do
      delete :destroy, id: @initialemployer
    end

    assert_redirected_to initialemployers_path
  end
end
