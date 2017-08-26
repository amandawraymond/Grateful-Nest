FactoryGirl.define do

  factory :list do
  end

  factory :list_item do
    sequence(:original_text){ |n| "This is the original text #{n}"}
    list { List.first || FactoryGirl.create(:list) }

    trait :with_blank_text do 
      original_text ""
    end
  end
end
