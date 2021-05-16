# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ScoutBadge.destroy_all

    Badge.destroy_all
    Scout.destroy_all




20.times do

    Scout.create(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    rank: ["Scout", "Tenderfoot", "Second Class", "First Class", "Star", "Life", "Eagle"].sample,
    username: Faker::Artist.name,
    password: "12345",
    )
end

list_of_badges = [
    "Camping",
    "Swimming",
    "First Aid",
    "Emergency Preparadness",
    "Cooking",
    "Citizenship in the Community",
    "Citizenship in the Nation",
    "Citizenship in the World",
    "Personal Fitness",
    "Environmental Science",
    "Family Life",
    "Communications"
]
    how_many_badges = list_of_badges.length


    list_of_badges.each do |badge|

        Badge.create(name: badge,
        description: "A Scout learns valuable skills to become a productive person.",
        eagle_Required: true)
    end

20.times do 
    ScoutBadge.create(date: Time.now,
        fun: [true,false].sample,
        scout: Scout.all.sample,
        badge: Badge.all.sample)
end 

20.times do
    Trip.create(location: Faker::Mountain.name,
    date: Time.now,
    scout_id: rand(1..100),
    )
end

puts "seeds planted"
