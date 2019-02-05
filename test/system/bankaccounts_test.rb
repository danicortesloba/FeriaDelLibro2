require "application_system_test_case"

class BankaccountsTest < ApplicationSystemTestCase
  setup do
    @bankaccount = bankaccounts(:one)
  end

  test "visiting the index" do
    visit bankaccounts_url
    assert_selector "h1", text: "Bankaccounts"
  end

  test "creating a Bankaccount" do
    visit bankaccounts_url
    click_on "New Bankaccount"

    fill_in "Account", with: @bankaccount.account
    fill_in "Bank", with: @bankaccount.bank
    fill_in "Email", with: @bankaccount.email
    fill_in "Name", with: @bankaccount.name
    fill_in "Rut", with: @bankaccount.rut
    fill_in "Type", with: @bankaccount.type
    fill_in "User", with: @bankaccount.user_id
    click_on "Create Bankaccount"

    assert_text "Bankaccount was successfully created"
    click_on "Back"
  end

  test "updating a Bankaccount" do
    visit bankaccounts_url
    click_on "Edit", match: :first

    fill_in "Account", with: @bankaccount.account
    fill_in "Bank", with: @bankaccount.bank
    fill_in "Email", with: @bankaccount.email
    fill_in "Name", with: @bankaccount.name
    fill_in "Rut", with: @bankaccount.rut
    fill_in "Type", with: @bankaccount.type
    fill_in "User", with: @bankaccount.user_id
    click_on "Update Bankaccount"

    assert_text "Bankaccount was successfully updated"
    click_on "Back"
  end

  test "destroying a Bankaccount" do
    visit bankaccounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bankaccount was successfully destroyed"
  end
end
