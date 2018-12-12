class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author_first_name
      t.string :author_last_name
      t.references :publisher, foreign_key: true
      t.string :cover
      t.integer :price
      t.integer :isbn
      t.text :synopsis

      t.timestamps
    end
  end
end
