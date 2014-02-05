require 'test_helper'

class RoadblocksControllerTest < ActionController::TestCase
  setup do
    @roadblock = roadblocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roadblocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create roadblock" do
    assert_difference('Roadblock.count') do
      post :create, roadblock: { code_snippet: @roadblock.code_snippet, description: @roadblock.description, error_message: @roadblock.error_message, solution: @roadblock.solution, user1_id: @roadblock.user1_id, user2_id: @roadblock.user2_id }
    end

    assert_redirected_to roadblock_path(assigns(:roadblock))
  end

  test "should show roadblock" do
    get :show, id: @roadblock
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @roadblock
    assert_response :success
  end

  test "should update roadblock" do
    patch :update, id: @roadblock, roadblock: { code_snippet: @roadblock.code_snippet, description: @roadblock.description, error_message: @roadblock.error_message, solution: @roadblock.solution, user1_id: @roadblock.user1_id, user2_id: @roadblock.user2_id }
    assert_redirected_to roadblock_path(assigns(:roadblock))
  end

  test "should destroy roadblock" do
    assert_difference('Roadblock.count', -1) do
      delete :destroy, id: @roadblock
    end

    assert_redirected_to roadblocks_path
  end
end
