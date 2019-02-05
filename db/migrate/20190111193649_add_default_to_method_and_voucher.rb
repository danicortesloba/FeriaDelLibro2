class AddDefaultToMethodAndVoucher < ActiveRecord::Migration[5.2]
  def change
    def up
  change_column :publishers, :voucher, :integer, default: 0
  end

def down
  change_column :publishers, :method, :integer, default: 0
end
  end
end
