class AddVoucherToPublisher < ActiveRecord::Migration[5.2]
  def change
    add_column :publishers, :voucher, :integer, default: 1
  end
end
