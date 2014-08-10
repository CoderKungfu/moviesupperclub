FactoryGirl.define do
  factory :movie do
    name Faker::Company.name
    rating ['G', 'PG', 'PG13', 'NC16', 'M18', 'R21'].sample
    active true
  end
end
