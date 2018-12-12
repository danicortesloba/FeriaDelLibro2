class CreateReaders < ActiveRecord::Migration[5.2]
  def change
    create_table :readers do |t|
      t.string :firstname
      t.string :lastname
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
