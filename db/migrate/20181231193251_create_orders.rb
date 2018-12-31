class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.boolean :payed, default: false

      t.timestamps
    end
  end
end
