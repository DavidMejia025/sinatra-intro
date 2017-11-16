require 'faker'

10.times do |i|
  Dog.create(name: Faker::Cat.name, age: rand(9) + 1)
end
