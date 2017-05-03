FactoryGirl.define do

  factory :message do
    body { Faker::Lorem.sentence }
    group_id { Faker::Number.number(2)}
    user_id { Faker::Number.number(2)}
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end

  factory :group do
    name { Faker::Pokemon.location }
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end

  factory :user do
    name { Faker::Pokemon.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(8, 10)}
  end
end
