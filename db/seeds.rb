# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Board.destroy_all
List.destroy_all
User.destroy_all

User.create(
  first_name: "Sam",
  last_name: "Sam",
  email: "sam@sam.com",
  password: "sam",
)

User.create(
  first_name: "tek",
  last_name: "tek",
  email: "tek@tek.com",
  password: "sam",
)

10.times do
  food = Faker::Food.dish
  Board.create(name: "#{food}", user_id: rand(User.first.id..User.last.id))
end

100.times do
  ingredients = Faker::Food.ingredient
  List.create(name: "#{ingredients}", board_id: Board.all.sample.id)
end

100.times do
  ingredients = Faker::Food.ingredient
  Card.create(name: "#{ingredients}", list_id: List.all.sample.id)
end

puts Cowsay.say("Created #{Board.all.count} Boards", :cow)
puts Cowsay.say("Created #{List.all.count} Lists", :cow)
puts Cowsay.say("Created #{Card.all.count} Cards", :cow)
puts Cowsay.say("Created #{User.all.count} Users", :cow)
