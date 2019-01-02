class CreateMembershipOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :membership_orders do |t|
      t.references :membership, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :paid, default: false

      t.timestamps
    end
  end
end
