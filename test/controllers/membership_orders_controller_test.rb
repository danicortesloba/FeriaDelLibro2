require 'test_helper'

class MembershipOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @membership_order = membership_orders(:one)
  end

  test "should get index" do
    get membership_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_membership_order_url
    assert_response :success
  end

  test "should create membership_order" do
    assert_difference('MembershipOrder.count') do
      post membership_orders_url, params: { membership_order: { membership_id: @membership_order.membership_id, paid: @membership_order.paid, user_id: @membership_order.user_id } }
    end

    assert_redirected_to membership_order_url(MembershipOrder.last)
  end

  test "should show membership_order" do
    get membership_order_url(@membership_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_membership_order_url(@membership_order)
    assert_response :success
  end

  test "should update membership_order" do
    patch membership_order_url(@membership_order), params: { membership_order: { membership_id: @membership_order.membership_id, paid: @membership_order.paid, user_id: @membership_order.user_id } }
    assert_redirected_to membership_order_url(@membership_order)
  end

  test "should destroy membership_order" do
    assert_difference('MembershipOrder.count', -1) do
      delete membership_order_url(@membership_order)
    end

    assert_redirected_to membership_orders_url
  end
end
