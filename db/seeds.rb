# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(
	name: "John",
	email: "adadada", 
	age: 22, 
	gender: "Male",
	phone_number: "0723432421"
)

User.create(
	name: "Alexandra",
	email: "alexadnra@gmail.com", 
	age: 25, 
	gender: "Female",
	phone_number: "0723214143"
)

User.create(
	name: "Mike",
	email: "mike@adadada.com", 
	age: 18, 
	gender: "Male",
	phone_number: "0754363412"
)

User.create(
	name: "Ioana",
	email: "ioana@adadada.com", 
	age: 19, 
	gender: "Female",
	phone_number: "0743524212"
)

User.create(
	name: "Andrei",
	email: "andrei@adadada.com", 
	age: 17, 
	gender: "Other",
	phone_number: "0745344241"
)