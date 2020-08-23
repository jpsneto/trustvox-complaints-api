FactoryBot.define do 
  factory :locale do
   city { "Ilheus" }
   state { "BA" }

   trait :invalid do
     city { nil }
     state { nil }
   end
  

  end
end
