FactoryGirl.define do

  factory :message do
    body        Faker::Lorem.sentence
    group_id    Faker::Number.number(2)
    user_id     Faker::Number.number(2)
    created_at  Faker::Time.between(2.days.ago, Time.now, :all)
  end
end
