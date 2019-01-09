class AddAddressToPublisher < ActiveRecord::Migration[5.2]
  def change
    add_column :publishers, :address, :text
  end
end
