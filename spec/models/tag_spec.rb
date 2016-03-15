require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "associations" do
    it "has many & belongs to many posts" do
      t = Tag.reflect_on_association(:posts)
      expect(t.macro).to eq(:has_and_belongs_to_many)
    end 
  end
end
