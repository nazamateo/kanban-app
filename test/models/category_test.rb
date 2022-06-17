require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save category without title" do
    category = Category.new id: 1, details: "random", user_id: 1, created_at: Date.current, updated_at: Date.current
    assert_not category.save, "Saved the category without a title"
  end
  
  test "should not save category without details" do
    category = Category.new id: 1, title: "random", user_id: 1, created_at: Date.current, updated_at: Date.current
    assert_not category.save, "Saved the category without a details"
  end
  
  test "should save category with complete params" do
    category = Category.new id: "1", title: "random", details: "random", user_id: "1", created_at: Date.current, updated_at: Date.current
    assert category.save, "Saved the category with complete params"
  end

  test "should report error" do
    # some_undefined_variable is not defined elsewhere in the test case
    assert_raises(NameError) do
    some_undefined_variable
    end 
  end

  test "title uniqueness not valid" do
    one = Category.new title: "same", details:"random"
    one.save
    two = Category.new title: "same", details:"random"
    assert_not two.save, "Saved duplicate category title"
  end


end
