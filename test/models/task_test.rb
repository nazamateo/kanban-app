require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "save task with complete params" do
    task = Task.new id:1,action_item:"action item", priority:"Medium", category_id:1, user_id:1, created_at:Date.current, updated_at:Date.current, deadline: Date.current
    assert task.save!
  end

end
