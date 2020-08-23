FactoryBot.define do
  factory :complaint do 
    title { "Pedido atrasado" }
    description { "Meu pedido esta atrasado e nao recebi nem ao menos o codigo de rastreio" } 
    company { "Europeias" }
    locale { build(:locale) }

    trait :invalid do 
      title { nil }
    end

    trait :with_invalid_locale do 
      association :locale, factory: [:locale, :invalid]
    end
  

  end
end