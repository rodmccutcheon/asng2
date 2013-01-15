FactoryGirl.define do
  
  factory :season do
    sequence(:name) { |n| "Season #{n}" }
  end

  factory :round do
    sequence(:name) { |n| "Round #{n}" }
    season
  end

  factory :team do
    sequence(:name) { |n| "Team #{n}" }
  end

  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'please'
    password_confirmation 'please'
  end
  
end