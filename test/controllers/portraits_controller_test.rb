require 'test_helper'

class PortraitsControllerTest < ActionController::TestCase
  setup do
    @portrait = portraits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:portraits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create portrait" do
    assert_difference('Portrait.count') do
      post :create, portrait: { img: @portrait.img, person_id: @portrait.person_id }
    end

    assert_redirected_to portrait_path(assigns(:portrait))
  end

  test "should show portrait" do
    get :show, id: @portrait
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @portrait
    assert_response :success
  end

  test "should update portrait" do
    patch :update, id: @portrait, portrait: { img: @portrait.img, person_id: @portrait.person_id }
    assert_redirected_to portrait_path(assigns(:portrait))
  end

  test "should destroy portrait" do
    assert_difference('Portrait.count', -1) do
      delete :destroy, id: @portrait
    end

    assert_redirected_to portraits_path
  end
end
