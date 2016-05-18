country_1 = Country.create(name: "Spain", continent: "Europe")
country_2 = Country.create(name: "Italy", continent: "Europe")

real_madrid = country_1.teams.create(name: "Real Madrid", date_founded: Date.new(1902,3,6), city: "Madrid", stadium: "Santiago Bernabeu", fans_nickname: "Merengues")
barcelona = country_1.teams.create(name: "Barcelona", date_founded: Date.new(1902,3,6), city: "Barcelona", stadium: "Camp Nou", fans_nickname: "Cules")

real_madrid_url = [
	"http://www.marca.com/en/football/real-madrid/2016/05/12/573430f6268e3e156b8b457c.html",
	"http://www.marca.com/en/football/real-madrid/2016/05/12/5734891ee2704e90648b4592.html",
	"http://www.marca.com/en/football/real-madrid/2016/05/12/57344882268e3e501b8b4627.html",
	"http://www.marca.com/en/football/real-madrid/2016/05/15/57382a49268e3ecf7a8b45b3.html",
	"http://www.marca.com/en/football/real-madrid/2016/05/16/57396621e2704e1d598b4658.html",
	"http://www.marca.com/en/football/real-madrid/2016/05/16/5739bc9b468aeb19478b45c9.html",
	"http://www.marca.com/en/football/real-madrid/2016/05/16/5738ee0746163f09728b461b.html",
	"http://www.marca.com/en/football/real-madrid/2016/05/16/5738e8e246163ff0318b4632.html",
	"http://www.marca.com/en/football/real-madrid/2016/05/16/5739e184e2704e376d8b4651.html",
	"http://www.marca.com/en/football/real-madrid/2016/05/17/573b2046e5fdea040a8b45a4.html",
	"http://www.marca.com/en/football/real-madrid/2016/05/17/573aea7be2704edb148b45f6.html",
	"http://www.marca.com/en/football/real-madrid/2016/05/17/573adcede2704e6d6a8b45e4.html"
]


barcelona_url = [ 
	"http://www.marca.com/en/football/barcelona/2016/05/14/57375fab22601da2468b45e0.html",
	"http://www.marca.com/en/football/barcelona/2016/05/14/5737621a22601d21518b45e8.html",
	"http://www.marca.com/en/football/barcelona/2016/05/14/57376ccf22601dcd6c8b4610.html",
	"http://www.marca.com/en/football/barcelona/2016/05/14/57377685468aeba2368b4688.html",
	"http://www.marca.com/en/football/barcelona/2016/05/14/57378398468aeb7d2a8b4678.html",
	"http://www.marca.com/en/football/barcelona/2016/05/15/573825c4268e3e2b6c8b459c.html",
	"http://www.marca.com/en/football/barcelona/2016/05/15/57384ec3268e3e3e6a8b45c6.html",
	"http://www.marca.com/en/football/barcelona/2016/05/15/57385be6468aeb372f8b45dd.html",
	"http://www.marca.com/en/football/barcelona/2016/05/15/57387b2ee2704e376d8b45de.html",
	"http://www.marca.com/en/football/barcelona/2016/05/15/5738d9f146163f85758b45e2.html",
	"http://www.marca.com/en/football/barcelona/2016/05/16/5738e21546163f2f2a8b45e7.html",
	"http://www.marca.com/en/football/barcelona/2016/05/17/573b0bc3e5fdea55598b4570.html"
]

real_madrid_url.each do |item|

	@the_team = real_madrid
	scraper = Webscrapper.new(item)
		@title = scraper.get_title
		@image = scraper.get_image
		@author = scraper.get_author
		@date = scraper.get_date
		@content = scraper.get_content

		@the_post = @the_team.posts.new(title: @title, image_url: @image, author: @author, date: @date, content: @content, source: "Marca")
		@the_post.save

end

barcelona_url.each do |item|

	@the_team = barcelona
	scraper = Webscrapper.new(item)
		@title = scraper.get_title
		@image = scraper.get_image
		@author = scraper.get_author
		@date = scraper.get_date
		@content = scraper.get_content

		@the_post = @the_team.posts.new(title: @title, image_url: @image, author: @author, date: @date, content: @content, source: "Marca")
		@the_post.save

end

the_team = real_madrid
the_statement_1 = the_team.statements.new(title: "Real Madrid deserves to win the Champions League", date: Date.new(2016, 5, 17), image_url: "http://e04-marca.uecdn.es/assets/multimedia/imagenes/2016/05/13/14631308640462.jpg", author: "myhattrick", description: "The team has overcome multiple obstacles during this season. A victory at the UEFA Champions League final would be a great recognition for their effort.")
the_statement_2 = the_team.statements.new(title: "Zizou should still be the head coach next season", date: Date.new(2016, 5, 17), image_url: "http://e04-marca.uecdn.es/assets/multimedia/imagenes/2016/05/13/14631298081782.jpg", author: "myhattrick", description: "With Zizou, the team has recovered confidence, which has also led them to finish the season on its best form.")
the_statement_3 = the_team.statements.new(title: "Real Madrid should hire Pierre Aubameyang", date: Date.new(2016, 5, 17), image_url: "http://e04-marca.uecdn.es/assets/multimedia/imagenes/2016/03/30/14593587489112.jpg", author: "myhattrick", description: "The striker is one of the best player of the Bundesliga. Additionally, he shared his interest on joining Real Madrid.")
the_statement_4 = the_team.statements.new(title: "Rafa Benitez was the main reason Real Madrid lost LaLiga", date: Date.new(2016, 5, 17), image_url: "http://e02-marca.uecdn.es/assets/multimedia/imagenes/2016/05/15/14633286944668.jpg", author: "myhattrick", description: "Under his leadership, the team lost key matches and he never managed to improve the atmosphere after.")
the_statement_5 = the_team.statements.new(title: "Zinadine Zidane is the greatest legend of Real Madrid", date: Date.new(2016, 5, 17), image_url: "http://e03-marca.uecdn.es/assets/multimedia/imagenes/2016/04/24/14614544429103.jpg", author: "myhattrick", description: "He won 'La Novena' as a player, 'La Decima' as an assistant coach and this season he guided the team to the UEFA Champions League final against Atletico de Madrid, where he will try to win 'La Undecima' as the head coach.")
the_statement_6 = the_team.statements.new(title: "Florentino Perez should resign as president of Real Madrid", date: Date.new(2016, 5, 17), image_url: "http://e03-marca.uecdn.es/assets/multimedia/imagenes/2016/01/26/14538104773071.jpg", author: "myhattrick", description: "Many fans think that the team and the club as a whole needs a new direction as they have only been able to win one league in the last eight years.")

the_statement_1.save
the_statement_2.save
the_statement_3.save
the_statement_4.save
the_statement_5.save
the_statement_6.save






# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
