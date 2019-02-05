class AddRazonToPublisher < ActiveRecord::Migration[5.2]
  def change
    add_column :publishers, :razon, :string
  end
end
