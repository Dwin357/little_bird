class Post < ActiveRecord::Base
  has_many :likes, foreign_key: :liked_id
  belongs_to :author, class_name: :User
  has_and_belongs_to_many :users
  has_and_belongs_to_many :tags
end
