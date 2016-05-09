require 'nokogiri'
require 'open-uri'
class Webscrapper < ActiveRecord::Base
	attr_reader :url, :data, :get_title

  # def initialize(url)
  #   @url = url
  # end

  def data(url)
    data = Nokogiri::HTML(open(url))
    data
  end


  def get_title(data)
  		title = ""
  		# puts "Look at me - #{data}"
  		data.search('.js-headline').each do |element|
  			title = element.inner_text
  		end

  		title

  		# data
	end


  	def get_image(data)
  		image = ""
	  	data.search('.full-image').each do |element|
	  		source = element.attr('src')
			source.slice!(0..1)
			image = "http://#{source}"
		end
		image
	end

	def get_author(data)
		author = ""
		data.search('.author-name').each do |element|
			author = element.inner_text
		end
		author
	end

	def get_date
		@data.search('.date').map do |element|
			element.attr('datetime')
		end
	end

	def get_content
		@data.search('div[itemprop=articleBody]//p').map do |element|
			element.inner_text
			""
		end
	end
end
