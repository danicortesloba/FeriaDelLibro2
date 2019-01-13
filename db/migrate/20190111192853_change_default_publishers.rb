class ChangeDefaultPublishers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :publishers, :method, nil
    change_column_default :publishers, :voucher, nil
  end
end
