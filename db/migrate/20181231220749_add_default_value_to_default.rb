class AddDefaultValueToDefault < ActiveRecord::Migration[5.2]

def up
  change_column :addresses, :default, :boolean, default: false
end

def down
  change_column :addresses, :default, :boolean, default: nil
end

end
