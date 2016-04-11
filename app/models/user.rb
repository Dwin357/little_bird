class User < ActiveRecord::Base
  has_many :authored_posts, foreign_key: :author_id, class_name: :Post
  has_many :likes, foreign_key: :liker_id
  has_and_belongs_to_many :posts 

  has_many :followed, through: :watching
  has_many :watching, {class_name: :Following, foreign_key: :follower_id}

  has_many :followers, through: :being_watched
  has_many :being_watched, {class_name: :Following, foreign_key: :followed_id}




  include BCrypt
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authentic_password?(_password)
    password == _password
  end

  def change_to_random_password
    random_password = Array.new(10).map{ (65+ rand(58)).chr }.join
    self.password = random_password
    self.save!
    random_password
  end

  def stream_posts
    self.followed.unshift(self).map(&:posts).flatten
  end

end
