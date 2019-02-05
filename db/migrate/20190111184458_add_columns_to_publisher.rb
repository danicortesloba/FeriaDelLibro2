class AddColumnsToPublisher < ActiveRecord::Migration[5.2]
  def change
    add_column :publishers, :facebook, :string, null: true
    add_column :publishers, :twitter, :string, null: true
    add_column :publishers, :instagram, :string, null: true
    add_column :publishers, :website, :string, null: true
  end
end
