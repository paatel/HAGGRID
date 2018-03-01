# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Item.destroy_all

user = User.create!(email: '1234@email.com', password: '1guest', first_name: 'Bubba', last_name: 'Gump', address: '12 fish dr')
user2 = User.create!(email: 'userboi@gmail.com', password: '2guest', first_name: 'Snuffy', last_name: 'Rumpkin', address: '48 imaginary lane')
user3 = User.create!(email: 'yellow@alamo.ca', password: '3guest', first_name: 'Colonel', last_name: 'Mustard', address: '1234 alamo dr')
item = Item.create!(name: 'Big sword', price: 4, stats: "+3 strength", details: "move heavy stuff and kill things", user: user)
item2 = Item.create!(name: 'Cursed staff', price: 5, stats: "+1 charisma", details: "You talk better but its cursed", user: user2)
item3 = Item.create!(name: 'Rubber dagger', price: 2, stats: "+1 dex", details: "Useless but funny", user: user)
item4 = Item.create!(name: 'cursed socks', price: 8, stats: "-1 charisma", details: "stinky", user: user3)
item5 = Item.create!(name: 'magic hat', price: 1, stats: "damage: social", details: "not actually magic", user: user)
item6 = Item.create!(name: 'robes', price: 10, stats: "magic: cookies", details: "Once worn by the great wizard Pierce", user: user2)
item7 = Item.create!(name: "Martin's cloak of invisibility", price: 20, stats: "stealth +5", details: "User will disappear upon ticket creation", user: user)
item8 = Item.create!(name: "Chicken of slaying", price: 3, stats: "Doom enchantment", details: "Emits a cry so terrible, none can stand against it", user: user2)

