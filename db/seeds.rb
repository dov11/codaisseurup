Category.destroy_all
User.destroy_all

shooting_a_movie = Category.create!(name: "Shooting a movie")
partying = Category.create!(name: "Partying")


keanu = User.create!(
email: "example@gmail.com",
password: "123456"
)
rutger = User.create!(
email: "rut@gmail.com",
password: "012345"
)

Event.create!(
name: "Matrix shooting",
description: "Making awesome movie",
location: "Vancuver",
price: 1_000_000,
capacity: 100,
includes_food: true,
includes_drinks: true,
starts_at: DateTime.new(1999,10,2),
ends_at: DateTime.new(1999,11,4),
active: true,
user: keanu,
categories: [shooting_a_movie, partying]
)
Event.create!(
name: "Blade Runner",
description: "Making awesome movie",
location: "NY",
price: 500_000,
capacity: 200,
includes_food: false,
includes_drinks: true,
starts_at: DateTime.new(1970,10,2),
ends_at: DateTime.new(1971,11,4),
active: true,
user: rutger,
categories: [shooting_a_movie]
)
