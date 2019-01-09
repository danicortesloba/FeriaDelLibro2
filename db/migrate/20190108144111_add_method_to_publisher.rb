class AddMethodToPublisher < ActiveRecord::Migration[5.2]
  def change
    add_column :publishers, :method, :integer, default: 1
  end
end
