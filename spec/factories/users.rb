FactoryBot.define do
  factory :user do
    first_name { "First" }
    last_name { "Last" }
    username { "Username" }
    email { Faker::Internet.email }
    password { "password"}
    password_confirmation { "password" }

    trait :invalid do
      first_name { "" }
    end

    trait :with_thoughts do
      after(:build) do |user|
        user.thoughts << FactoryBot.build_list(:thought, 2)
      end
    end
  end
end
