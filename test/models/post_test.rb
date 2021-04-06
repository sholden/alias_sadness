require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "can join to comments with a where condition" do
    scope = Post.joins(:comments).where(comments: { body: 'Hello world'})
    puts scope.to_sql
    assert_nothing_raised { scope.to_a }
  end
end
