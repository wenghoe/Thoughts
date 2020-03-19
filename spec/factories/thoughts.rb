# frozen_string_literal: true

FactoryBot.define do
  factory :thought do
    content { 'Content #content' }
    visible { true }

    trait :invalid do
      content { '' }
    end
  end
end
