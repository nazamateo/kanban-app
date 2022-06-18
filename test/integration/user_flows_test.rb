require "test_helper"

class UserFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users :user_001
    @category = categories :one
  end

  test "user flow" do 
    # able to view account registration page
    get new_user_registration_path
    assert_response :success
    
    # able to submit account registration
    post user_registration_path, params: {'user[email]' => @user.email, 'user[first_name]' => @user.first_name, 'user[last_name]' => @user.last_name, 'user[password]' => @user.encrypted_password, 'user[time_zone]' => @user.time_zone}
    assert_response :success
    
    # able to view account sign in page
    get new_user_session_path
    assert_response :success
  
    # able to sign in to account
    sign_in users(:user_001)
    assert_response :success
    
    # able to view home page
    get home_index_path
    assert_response :success
    
    #able to view dashboard page
    get categories_path
    assert_response :success
    
    #able to view new category page
    get new_category_path
    assert_response :success
    assert_select "form input", 3
    assert_select "form input" do
      assert_select "[name=?]", "category[title]"
      assert_select "[name=?]", "category[details]"
    end
    
    #able to submit category form
    post categories_path, params: {'category[title]' => 'title', 'category[details]' => 'details'}
    assert_redirected_to category_path(Category.last)
    follow_redirect!
    assert_response :success
    assert_select "p", "Category was successfully created!."
    assert_select "a", "My Dashboard"
    assert_select "a", "New Task"
    
    #able to view new task page
    get new_category_task_path(Category.last)
    assert_response :success
    assert_select "form input", 3
    assert_select "form input" do
      assert_select "[name=?]", "task[action_item]"
      assert_select "[name=?]", "task[deadline]"
    end
    assert_select "form select[name=?]", 'task[priority]'
    
    #able to submit task form
    post category_tasks_path, params: {'task[action_item]' => 'action item', 'task[priority]' => 'Medium', 'task[deadline]' => Date.current}
    assert_redirected_to task_path(Task.last)
    follow_redirect!
    assert_response :success
    assert_select "p", "Task was successfully created!."
    assert_select "a", "My Dashboard"
    
    #able to view dashboard page with category and task table
    get categories_path
    assert_response :success
    assert_select "a", "title"
    assert_select "a", "Update"
    assert_select "a", "Delete"
    assert_select "a", "New Task"
    assert_select "table", 1
    assert_select "table" do
      assert_select "tbody", 1
      assert_select "tr", 2
      assert_select "th", 4
      assert_select "td", 4
    end
    
    #able to view edit task page
    get edit_task_path(Task.last)
    assert_response :success
    
    #able to submit edit task form
    patch task_path, params: {'task[action_item]' => 'action item revised', 'task[priority]' => 'Medium', 'task[deadline]' => Date.current}
    assert_redirected_to task_path(Task.last)
    follow_redirect!
    assert_response :success
    assert_select "p", "Task was successfully updated!."
    assert_select "a", "My Dashboard"
        
    #able to get edit category page
    get edit_category_path(Category.last)
    assert_response :success
    
    #able to submit edit category form
    patch category_path(Category.last), params: {'category[title]' => 'title revised', 'category[details]' => 'details revised'}
    assert_redirected_to category_path(Category.last)
    follow_redirect!
    assert_response :success
    assert_select "p", "Category was successfully updated!."
    assert_select "a", "My Dashboard"
    
    #able to delete task
    delete task_path(Task.last)
    assert_redirected_to categories_path
    follow_redirect!
    assert_response :success
    assert_select "p", "Task was successfully deleted!"
    
    #able to delete category
    delete category_path(Category.last)
    assert_redirected_to categories_path
    follow_redirect!
    assert_response :success
    assert_select "p", "Category was successfully deleted!"
    
    #able to sign out user
    delete destroy_user_session_path
    assert_redirected_to root_path
  end
end
