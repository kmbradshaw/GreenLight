# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  User.create!(email: Faker::Internet.email,
               name: Faker::Name.name,
               password: "password")
end

3.times do 
Redlight.create!(user_id: rand(1..10),
                 problems: Faker::Lorem.paragraph(2, true))
end
