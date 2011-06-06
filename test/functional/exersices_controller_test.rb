require 'test_helper'

class ExersicesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exersices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exersice" do
    assert_difference('Exersice.count') do
      post :create, :exersice => { }
    end

    assert_redirected_to exersice_path(assigns(:exersice))
  end

  test "should show exersice" do
    get :show, :id => exersices(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => exersices(:one).to_param
    assert_response :success
  end

  test "should update exersice" do
    put :update, :id => exersices(:one).to_param, :exersice => { }
    assert_redirected_to exersice_path(assigns(:exersice))
  end

  test "should destroy exersice" do
    assert_difference('Exersice.count', -1) do
      delete :destroy, :id => exersices(:one).to_param
    end

    assert_redirected_to exersices_path
  end
end
