require 'test_helper'

class PublisherCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @publisher_comment = publisher_comments(:one)
  end

  test "should get index" do
    get publisher_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_publisher_comment_url
    assert_response :success
  end

  test "should create publisher_comment" do
    assert_difference('PublisherComment.count') do
      post publisher_comments_url, params: { publisher_comment: { content: @publisher_comment.content, publisher_id: @publisher_comment.publisher_id, user_id: @publisher_comment.user_id } }
    end

    assert_redirected_to publisher_comment_url(PublisherComment.last)
  end

  test "should show publisher_comment" do
    get publisher_comment_url(@publisher_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_publisher_comment_url(@publisher_comment)
    assert_response :success
  end

  test "should update publisher_comment" do
    patch publisher_comment_url(@publisher_comment), params: { publisher_comment: { content: @publisher_comment.content, publisher_id: @publisher_comment.publisher_id, user_id: @publisher_comment.user_id } }
    assert_redirected_to publisher_comment_url(@publisher_comment)
  end

  test "should destroy publisher_comment" do
    assert_difference('PublisherComment.count', -1) do
      delete publisher_comment_url(@publisher_comment)
    end

    assert_redirected_to publisher_comments_url
  end
end
