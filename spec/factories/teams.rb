FactoryBot.define do
  factory :team do
    name { Faker::Team.name }
    founded_year { 1950 }
  end
end
