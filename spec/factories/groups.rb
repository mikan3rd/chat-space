FactoryGirl.define do
  factory :group do
    name        Faker::Pokemon.location
    created_at  Faker::Time.between(2.days.ago, Time.now, :all)

    after(:create) do |group|
      user = User.first
      create(:group_user, user: user, group: group)
    end
  end
end
