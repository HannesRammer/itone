require 'test_helper'

class PhotoAdminsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photo_admins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photo_admin" do
    assert_difference('PhotoAdmin.count') do
      post :create, :photo_admin => { }
    end

    assert_redirected_to photo_admin_path(assigns(:photo_admin))
  end

  test "should show photo_admin" do
    get :show, :id => photo_admins(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => photo_admins(:one).to_param
    assert_response :success
  end

  test "should update photo_admin" do
    put :update, :id => photo_admins(:one).to_param, :photo_admin => { }
    assert_redirected_to photo_admin_path(assigns(:photo_admin))
  end

  test "should destroy photo_admin" do
    assert_difference('PhotoAdmin.count', -1) do
      delete :destroy, :id => photo_admins(:one).to_param
    end

    assert_redirected_to photo_admins_path
  end
end
