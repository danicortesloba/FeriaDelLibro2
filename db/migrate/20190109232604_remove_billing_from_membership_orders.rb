class RemoveBillingFromMembershipOrders < ActiveRecord::Migration[5.2]
  def change
    remove_reference :membership_orders, :billing, foreign_key: true
  end
end
