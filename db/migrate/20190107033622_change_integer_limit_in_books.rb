class ChangeIntegerLimitInBooks < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :isbn, :integer, limit: 8
  end
end
