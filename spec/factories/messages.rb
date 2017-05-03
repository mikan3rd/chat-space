FactoryGirl.define do

  factory :message do
    body        Faker::Lorem.sentence
    group_id    Group.first
    user_id     User.first
    created_at  Faker::Time.between(2.days.ago, Time.now, :all)
  end
end
