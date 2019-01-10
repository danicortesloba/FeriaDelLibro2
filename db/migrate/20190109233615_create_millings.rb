class CreateMillings < ActiveRecord::Migration[5.2]
  def change
    create_table :millings do |t|
      t.string :code
      t.string :payment_method
      t.decimal :amount, precision: 10, scale: 2
      t.string :currency
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
