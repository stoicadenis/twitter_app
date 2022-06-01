require "test_helper"

class RelationshipTest < ActiveSupport::TestCase
  def setup
    @relationship = Relationship.new(
      follower_id: user(:mike).id, followed_id: user(:andrei).id
      )
  end

  test "should_be_valid" do
    assert @relationship.valid?
  end

  test "should require follower_id" do
    @relationship.follower_id = nil
    assert_not @relationship.valid?
  end

  test "should require followed_id" do
    @relationship.followed_id = nil
    assert_not @relationship.valid?
  end
end
