class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :address
      t.boolean :default

      t.timestamps
    end
  end
end
