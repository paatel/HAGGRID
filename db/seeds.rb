# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Item.destroy_all

user = User.create!(email: '1234@email.com', password: '1guest')
user2 = User.create!(email: 'userboi@gmail.com', password: '2guest')
item = Item.create!(name: 'Big sword', price: 4, stats: "+3 strength", details: "move heavy stuff and kill things", user: user)
item2 = Item.create!(name: 'Cursed staff', price: 5, stats: "+1 charisma", details: "You talk better but its cursed", user: user2)
item3 = Item.create!(name: 'Rubber dagger', price: 2, stats: "+1 dex", details: "Useless but funny", user: user)
