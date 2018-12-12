require 'test_helper'

class ReadersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reader = readers(:one)
  end

  test "should get index" do
    get readers_url
    assert_response :success
  end

  test "should get new" do
    get new_reader_url
    assert_response :success
  end

  test "should create reader" do
    assert_difference('Reader.count') do
      post readers_url, params: { reader: { firstname: @reader.firstname, lastname: @reader.lastname, user_id: @reader.user_id } }
    end

    assert_redirected_to reader_url(Reader.last)
  end

  test "should show reader" do
    get reader_url(@reader)
    assert_response :success
  end

  test "should get edit" do
    get edit_reader_url(@reader)
    assert_response :success
  end

  test "should update reader" do
    patch reader_url(@reader), params: { reader: { firstname: @reader.firstname, lastname: @reader.lastname, user_id: @reader.user_id } }
    assert_redirected_to reader_url(@reader)
  end

  test "should destroy reader" do
    assert_difference('Reader.count', -1) do
      delete reader_url(@reader)
    end

    assert_redirected_to readers_url
  end
end
