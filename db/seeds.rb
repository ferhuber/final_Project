# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# User.create(first_name: "fernando", last_name: "huber", email:"fernando.huber@gmail.com", password: "p0o9i8u7", is_admin: true)

10.times do

  Auction.create(title: Faker::Commerce.product_name ,details: Faker::Lorem.sentence, reserve_price: Faker::Commerce.price)

end
