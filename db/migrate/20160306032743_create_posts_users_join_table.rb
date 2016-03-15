class CreatePostsUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :posts_users do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps null: false
    end

    add_index :posts_users, :user_id
    add_index :posts_users, :post_id
  end
end
