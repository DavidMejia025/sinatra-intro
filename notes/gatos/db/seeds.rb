require 'faker'

10.times do |i|
  Cat.create(name: Faker::Cat.name, age: rand(9) + 1)
end
