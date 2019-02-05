class ChangeColumnNameType < ActiveRecord::Migration[5.2]
  def change
    rename_column :bankaccounts, :type, :accounttype
    rename_column :bankaccounts, :ownerrut, :rut
  end
end
