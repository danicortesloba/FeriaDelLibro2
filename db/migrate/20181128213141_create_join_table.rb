class CreateJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :books, :genres do |t| end
  end
end
