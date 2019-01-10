class AddMembershipBillingToMembershipOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :membership_orders, :membership_billing, foreign_key: true
  end
end
