class User < ActiveRecord::Base
  has_many :authored_posts, foreign_key: :author_id, class_name: :Post
  has_many :likes, foreign_key: :liker_id
  has_and_belongs_to_many :posts 


##########  not applying scope, not clear why not ###
  has_many :followed, through: :watching
  has_many :followers, through: :being_watched

  # private
  has_many :watching, {class_name: :Following, foreign_key: :follower_id}, -> { where blocked: false }
  has_many :being_watched, {class_name: :Following, foreign_key: :followed_id}, -> { where blocked: false }
#####################

end
