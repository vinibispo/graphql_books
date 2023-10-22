FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    description { Faker::Movie.quote }
    published_at { rand(Date.civil(1800, 1, 1)..Date.civil(2000, 12, 31)) }
  end
end
