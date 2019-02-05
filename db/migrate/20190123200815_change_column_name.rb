class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change

    rename_column :bankaccounts, :rut, :ownerrut
  end
end
