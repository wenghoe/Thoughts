FactoryBot.define do
  factory :thought do
    content { "Content" }

    trait :invalid do
      content { "" }
    end
  end
end
