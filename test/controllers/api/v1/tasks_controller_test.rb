require 'test_helper'

class Api::V1::TasksControllerTest < ActionController::TestCase
  setup do
    @api_v1_task = api_v1_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:api_v1_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create api_v1_task" do
    assert_difference('Api::V1::Task.count') do
      post :create, api_v1_task: { content: @api_v1_task.content, status: @api_v1_task.status }
    end

    assert_redirected_to api_v1_task_path(assigns(:api_v1_task))
  end

  test "should show api_v1_task" do
    get :show, id: @api_v1_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @api_v1_task
    assert_response :success
  end

  test "should update api_v1_task" do
    patch :update, id: @api_v1_task, api_v1_task: { content: @api_v1_task.content, status: @api_v1_task.status }
    assert_redirected_to api_v1_task_path(assigns(:api_v1_task))
  end

  test "should destroy api_v1_task" do
    assert_difference('Api::V1::Task.count', -1) do
      delete :destroy, id: @api_v1_task
    end

    assert_redirected_to api_v1_tasks_path
  end
end
