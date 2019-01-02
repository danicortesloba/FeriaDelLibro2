require "application_system_test_case"

class MembershipOrdersTest < ApplicationSystemTestCase
  setup do
    @membership_order = membership_orders(:one)
  end

  test "visiting the index" do
    visit membership_orders_url
    assert_selector "h1", text: "Membership Orders"
  end

  test "creating a Membership order" do
    visit membership_orders_url
    click_on "New Membership Order"

    fill_in "Membership", with: @membership_order.membership_id
    fill_in "Paid", with: @membership_order.paid
    fill_in "User", with: @membership_order.user_id
    click_on "Create Membership order"

    assert_text "Membership order was successfully created"
    click_on "Back"
  end

  test "updating a Membership order" do
    visit membership_orders_url
    click_on "Edit", match: :first

    fill_in "Membership", with: @membership_order.membership_id
    fill_in "Paid", with: @membership_order.paid
    fill_in "User", with: @membership_order.user_id
    click_on "Update Membership order"

    assert_text "Membership order was successfully updated"
    click_on "Back"
  end

  test "destroying a Membership order" do
    visit membership_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Membership order was successfully destroyed"
  end
end
