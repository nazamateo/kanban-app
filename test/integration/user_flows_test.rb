require "test_helper"

class UserFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get sign up" do
    get "/users/sign_up"
    assert_response :success
  end

  test "sign up page should have user details input fields" do
    get "/users/sign_up"
    assert_select "form input", 6
  end

  test "sign up page should have user email,first name, last name, password and confirm password input field" do
    get "/users/sign_up"
    assert_select "form input" do
      assert_select "[name=?]", "user[email]"
      assert_select "[name=?]", "user[first_name]"
      assert_select "[name=?]", "user[last_name]"
      assert_select "[name=?]", "user[password]"
      assert_select "[name=?]", "user[password_confirmation]"
    end
  end
  
  test "sign up page should have user email input field" do
    get "/users/sign_up"
    assert_select "form select" do
      assert_select "[name=?]", "user[time_zone]"
    end
  end

  test "sign up page should have submit button" do
    get "/users/sign_up"
    assert_select "form input" do
      assert_select "[type=?]","submit"
      assert_select "[type=submit][value=?]", "Sign Up"
    end
  end
  
  # test "user can sign up" do
  #   post "/users", params: {email: "user@email.com", first_name: "first", last_name: "last", password: "123456", time_zone: "UTC", commit: "Sign Up"}
  #   assert_response :redirect 
  # end

  test "should get sign in" do
    get "/users/sign_in"
    assert_response :success
  end

end
