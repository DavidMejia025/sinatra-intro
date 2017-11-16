require 'faker'

# tags = []
# 5.times do
# 	tag = Tag.create(content: Faker::Book.genre )
# end

20.times do
	entry = Entry.create(autor: Faker::LordOfTheRings.character,
				 title: Faker::LordOfTheRings.location,
				 content: Faker::Lorem.words(rand(1..200)).join(" "),
				 likes:  rand(1..500) )

	entry = entry.tags << Tag.where(rand(34..38))
end
