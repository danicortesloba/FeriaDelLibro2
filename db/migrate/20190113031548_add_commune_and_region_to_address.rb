class AddCommuneAndRegionToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :commune, :string
    add_column :addresses, :region, :string
  end
end
