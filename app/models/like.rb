class Like < ActiveRecord::Base
  belongs_to :posts, foreign_key: :liked_id
  belongs_to :users, foreign_key: :liker_id
end
