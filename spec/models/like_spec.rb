require 'rails_helper'

RSpec.describe Like, type: :model do
  it "belongs to a post" do
    t = Like.reflect_on_association(:posts)
    expect(t.macro).to eq(:belongs_to)
  end 
  it "belongs to a user" do
    t = Like.reflect_on_association(:users)
    expect(t.macro).to eq(:belongs_to)
  end 
end
