class AddDeliveryToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :delivery, :boolean, default: false
  end
end
