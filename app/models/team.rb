class Team < ActiveRecord::Base
	belongs_to :country
	has_many :posts
	has_many :statements
end
