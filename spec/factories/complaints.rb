# frozen_string_literal: true
FactoryBot.define do
  factory :complaint do
    title { Faker::Lorem.sentence(word_count: 3) }
    description { Faker::Lorem.paragraph }
    company { Faker::Company.name }
    locale { build(:locale) }

    trait :invalid do
      title { nil }
    end

    trait :with_invalid_locale do
      association :locale, factory: [:locale, :invalid]
    end
  end
end
