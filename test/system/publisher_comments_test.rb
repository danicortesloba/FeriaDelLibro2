require "application_system_test_case"

class PublisherCommentsTest < ApplicationSystemTestCase
  setup do
    @publisher_comment = publisher_comments(:one)
  end

  test "visiting the index" do
    visit publisher_comments_url
    assert_selector "h1", text: "Publisher Comments"
  end

  test "creating a Publisher comment" do
    visit publisher_comments_url
    click_on "New Publisher Comment"

    fill_in "Content", with: @publisher_comment.content
    fill_in "Publisher", with: @publisher_comment.publisher_id
    fill_in "User", with: @publisher_comment.user_id
    click_on "Create Publisher comment"

    assert_text "Publisher comment was successfully created"
    click_on "Back"
  end

  test "updating a Publisher comment" do
    visit publisher_comments_url
    click_on "Edit", match: :first

    fill_in "Content", with: @publisher_comment.content
    fill_in "Publisher", with: @publisher_comment.publisher_id
    fill_in "User", with: @publisher_comment.user_id
    click_on "Update Publisher comment"

    assert_text "Publisher comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Publisher comment" do
    visit publisher_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Publisher comment was successfully destroyed"
  end
end
