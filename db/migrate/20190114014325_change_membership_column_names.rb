class ChangeMembershipColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :memberships, :Benefit1, :benefit1
    rename_column :memberships, :Benefit2, :benefit2
    rename_column :memberships, :Benefit3, :benefit3
    rename_column :memberships, :Benefit4, :benefit4
    rename_column :memberships, :Benefit5, :benefit5
  end
end
