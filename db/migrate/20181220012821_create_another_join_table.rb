class CreateAnotherJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :books, :comments do |t|
      # t.index [:book_id, :comment_id]
      # t.index [:comment_id, :book_id]
    end
  end
end
