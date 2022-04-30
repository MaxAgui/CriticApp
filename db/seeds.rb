# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts "Seeding DB"

Game.destroy_all
Genre.destroy_all

puts "Loading Genres"
gen1 = Genre.create(name: "Action")
gen2 = Genre.create(name: "Adventure")
gen3 = Genre.create(name: "Post-Apocaliptic")
gen4 = Genre.create(name: "Shooter")
gen5 = Genre.create(name: "RPG")
gen6 = Genre.create(name: "Puzzle")



puts "Loading Games"
us = Game.create(name: "The Last of Us", 
                 summary: "Zombie apocalipse",
                 release_date: "14-09-2018",
                 rating: 94.0)

us.genres.push(gen1)
us.genres.push(gen2)
us.genres.push(gen3)

border = Game.create(name: "Borderlands 3", 
                 summary: "Post-apocalipse parody",
                 release_date: "14-09-2018",
                 rating: 90.0)

border.genres.push(gen2)
border.genres.push(gen3)
border.genres.push(gen4)
border.genres.push(gen5)

tomb = Game.create(name: "Shadow of the Tomb Raider", 
                 summary: "Action-adventure game",
                 release_date: "14-09-2018",
                 rating: 86.5
                )
tomb.genres.push(gen1)
tomb.genres.push(gen2)
tomb.genres.push(gen5)
tomb.genres.push(gen6)
