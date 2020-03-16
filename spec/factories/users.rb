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
  end
end
