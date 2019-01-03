class CreateNewJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :publishers, :publisher_comments do |t|
      # t.index [:publisher_id, :publisher_comment_id]
      # t.index [:publisher_comment_id, :publisher_id]
    end
  end
end
