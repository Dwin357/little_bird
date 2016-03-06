class CreateTagsPostsJoinTable < ActiveRecord::Migration
  def change
    create_table :tags_posts do |t|
      t.integer :tag_id
      t.integer :post_id

      t.timestamps null: false
    end


    add_index :tags_posts, :tag_id
    add_index :tags_posts, :post_id
  end
end
