class AddBenefitsToMembership < ActiveRecord::Migration[5.2]
  def change
    add_column :memberships, :Benefit1, :string, null: true
    add_column :memberships, :Benefit2, :string, null: true
    add_column :memberships, :Benefit3, :string, null: true
    add_column :memberships, :Benefit4, :string, null: true
    add_column :memberships, :Benefit5, :string, null: true
  end
end
