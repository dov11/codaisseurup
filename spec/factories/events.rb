FactoryGirl.define do
  factory :event do
    name              {Faker::Name.name}
    description       {Faker::Lorem.sentence}
    location          {Faker::Lorem.word}
    price             {Faker::Number.number(6)}
    capacity          {Faker::Number.number(3)}
    includes_food     true
    includes_drinks   true
    starts_at         DateTime.new(1999,10,2)
    ends_at           DateTime.new(1999,11,4)

    user              { build(:user) }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
