require 'faker'

5.times do
  owner = Owner.create!(name: Faker::StarWars.character, email: Faker::Internet.email, address: "#{Faker::Address.city}, #{Faker::Address.street_address}", gender: ["F", "M"].sample, age: rand(150) + 18)

  2.times do
    owner.dogs.create!(name: Faker::Pokemon.name, age: rand(15) + 1)
  end
end



# 10.times do
#   Dog.create!(name: Faker::Pokemon.name, age: rand(15) + 1, owner_id: rand(6) + 1)
# end
# Owner(id: integer, name: string, email: string, address: string, gender: string, age: integer, created_at: datetime, updated_at: datetime)



