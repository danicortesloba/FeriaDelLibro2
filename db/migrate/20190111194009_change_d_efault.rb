class ChangeDEfault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :publishers, :method, 0
    change_column_default :publishers, :voucher, 0
  end
end
