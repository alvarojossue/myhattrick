country_1 = Country.create(name: "Spain", continent: "Europe")
country_2 = Country.create(name: "Italy", continent: "Europe")

real_madrid = country_1.teams.create(name: "Real Madrid", date_founded: Date.new(1902,3,6), city: "Madrid", stadium: "Santiago Bernabeu", fans_nickname: "Merengues")
barcelona = country_1.teams.create(name: "Barcelona", date_founded: Date.new(1902,3,6), city: "Barcelona", stadium: "Camp Nou", fans_nickname: "Cules")

# real_madrid_url = [
# 	"http://www.marca.com/en/football/real-madrid/2016/05/12/573430f6268e3e156b8b457c.html",
# 	"http://www.marca.com/en/football/real-madrid/2016/05/12/5734891ee2704e90648b4592.html",
# 	"http://www.marca.com/en/football/real-madrid/2016/05/12/57344882268e3e501b8b4627.html"
# ]

# real_madrid_url.each do |item|
	
# 	@the_team = real_madrid
# 	scraper = Webscrapper.new(item)
# 		@title = scraper.get_title
# 		@image = scraper.get_image
# 		@author = scraper.get_author
# 		@date = scraper.get_date
# 		@content = scraper.get_content

# 		@the_post = @the_team.posts.new(title: @title, image_url: @image, author: @author, date: @date, content: @content, source: "Marca")

# end








# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
