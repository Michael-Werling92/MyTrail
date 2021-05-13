# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do

    Scout.create(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    rank: Faker::Mountain.name,
    username: Faker::Artist.name,
    password: "12345",
    )
end

20.times do
    Trip.create(location: Faker::Mountain.name,
    date: Time.now,
    scout_id: rand(1..100),
    )
end

puts "seeds planted"
