require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "associations" do
    it "has many likes" do
      t = Post.reflect_on_association(:likes)
      expect(t.macro).to eq(:has_many)
    end 
    it "belongs_to an author" do
      t = Post.reflect_on_association(:author)
      expect(t.macro).to eq(:belongs_to)
    end 
    it "has many & belongs to uers" do
      t = Post.reflect_on_association(:users)
      expect(t.macro).to eq(:has_and_belongs_to_many)
    end 
    it "has & belongs to many tags" do
      t = Post.reflect_on_association(:tags)
      expect(t.macro).to eq(:has_and_belongs_to_many)
    end 
  end
end
