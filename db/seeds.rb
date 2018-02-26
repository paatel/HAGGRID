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
item = Item.create!(name: 'Big sword', price: 4, stats: "+3 strength", details: "move heavy stuff and kill things", user: user)
