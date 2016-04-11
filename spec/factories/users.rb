FactoryGirl.define do
  factory :user do
    username "Batman"
    password "joker"
  end
  factory :wonderwoman, class: User do
    username "Wonderwoman"
    password "circe"
  end

  # factory :followed_user do
  #   after(:create) do |user|
  #     wonderwoman = create(:wonderwoman)
  #     create(:following, followed: user, follower: wonderwoman)
  #   end
  # end

  factory :following_user, parent: :user do
    after(:create) do |user|
      wonderwoman = create(:wonderwoman)
      create(:following, follower: wonderwoman, followed: user)
      user
    end
  end


end
