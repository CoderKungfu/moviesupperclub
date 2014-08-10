FactoryGirl.define do
  factory :cinema do
    name Faker::Company.name
    group [Cinema::GROUP_GV, Cinema::GROUP_CATHAY, Cinema::GROUP_SHAW, Cinema::GROUP_FG].sample
    cinema_code Faker::Number.number(2)
    active true
  end
end
