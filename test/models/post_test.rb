require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:mike)
    @post = Post.new(title: "First", description: "Second", user_id: @user.id)
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "user_id should be valid" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "title should be valid" do
    @post.title = nil
    assert_not @post.valid?
  end

  test "description should be valid" do
    @post.description = "   "
    assert_not @post.valid?
  end

  test "description should be at most 120 chars" do
    @post.description = "a" * 130
    assert_not @post.valid?
  end

  test "order should be most recent first" do
    assert_equal posts(:four), Post.first
  end
end
