User.destroy_all

keanu = User.create!(
email: "example@gmail.com",
password: "123456"
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
user: keanu
)
