require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it "has many authored posts" do
      t = User.reflect_on_association(:authored_posts)
      expect(t.macro).to eq(:has_many)
    end 
    it "has many likes" do
      t = User.reflect_on_association(:likes)
      expect(t.macro).to eq(:has_many)
    end 
    it "has many & belongs to many posts" do
      t = User.reflect_on_association(:posts)
      expect(t.macro).to eq(:has_and_belongs_to_many)
    end 
  end
end
