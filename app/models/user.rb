class User < ActiveRecord::Base
  has_many :authored_posts, foreign_key: :author_id, class_name: :Post
  has_many :likes, foreign_key: :liker_id
  has_and_belongs_to_many :posts 
end
