require 'nokogiri'
require 'open-uri'
class Webscrapper 
	attr_reader :url, :data

  def initialize(url)
    @url = url
    @data = Nokogiri::HTML(open(@url))
  end

  def get_title
  		title = ""
  		# puts "Look at me - #{data}"
  		data.search('.js-headline').each do |element|
  			title = element.inner_text
  		end

  		title

  		# data
	end


  	def get_image
  		image = ""
	  	data.search('.full-image').each do |element|
	  		source = element.attr('src')
			source.slice!(0..1)
			image = "http://#{source}"
		end
		image
	end

	def get_author
		author = ""
		data.search('.author-name').each do |element|
			author = element.inner_text
		end
		author
	end

	def get_date
		date = ""
		data.search('.date').each do |element|
			date = element.attr('datetime')
		end
		real_date = Date.parse date
	end

	def get_content
		content = ""
		data.search('div[itemprop=articleBody]//p').map do |element|
			content = content + element.inner_text
		end
		content
	end
end
