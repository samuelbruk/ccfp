# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Board.destroy_all
List.destroy_all

10.times do
  food = Faker::Food.dish
  Board.create(name: "#{food}")
end

10.times do
  ingredients = Faker::Food.ingredient
  List.create(name: "#{ingredients}", board_id: Board.all.sample.id)
end

puts Cowsay.say("Created #{Board.all.count} Boards", :cow)
puts Cowsay.say("Created #{List.all.count} Lists", :cow)
