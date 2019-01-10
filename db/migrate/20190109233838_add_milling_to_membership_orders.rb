class AddMillingToMembershipOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :membership_orders, :milling, foreign_key: true
  end
end
