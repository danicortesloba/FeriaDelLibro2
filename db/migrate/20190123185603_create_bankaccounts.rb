class CreateBankaccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :bankaccounts do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :bank
      t.string :type
      t.integer :rut
      t.integer :account
      t.string :email

      t.timestamps
    end
  end
end
