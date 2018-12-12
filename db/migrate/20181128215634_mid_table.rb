class MidTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :movies, :tags do |t|
  end
end
end
