class CreatePublisherComments < ActiveRecord::Migration[5.2]
  def change
    create_table :publisher_comments do |t|
      t.string :content
      t.references :publisher, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
