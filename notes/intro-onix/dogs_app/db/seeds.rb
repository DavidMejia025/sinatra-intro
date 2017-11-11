require 'faker'

10.times do
  Dog.create!(name: Faker::Pokemon.name, age: rand(15) + 1)
end
