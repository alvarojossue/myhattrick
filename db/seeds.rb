country_1 = Country.create(name: "Spain", continent: "Europe")
country_2 = Country.create(name: "Italy", continent: "Europe")

country_1.teams.create(name: "Real Madrid", date_founded: Date.new(1902,3,6), city: "Madrid", stadium: "Santiago Bernabeu", fans_nickname: "Merengues")
country_1.teams[0].posts.create(title: "Real Madrid a la final", date: Date.new(2016, 5, 7), author: "Alvaro Castillo", image_url: "#", content: "parrafo de contenido aca", source: "Cultura Beta")
country_1.teams[0].posts.create(title: "Real Madrid a un paso del titulo", date: Date.new(2016, 5, 7), author: "Jossue Garcia", image_url: "#", content: "parrafo de contenido aca", source: "Marca")
country_1.teams[0].posts.create(title: "Real Madrid sigue ganando", date: Date.new(2016, 5, 7), author: "Jose Castillo", image_url: "#", content: "parrafo de contenido aca", source: "As")
country_1.teams[0].posts.create(title: "Real Madrid no para", date: Date.new(2016, 5, 7), author: "Angel Garcia", image_url: "#", content: "parrafo de contenido aca", source: "Bernabeu Digital")





# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
