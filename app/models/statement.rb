class Statement < ActiveRecord::Base
	belongs_to :team
	has_many :reactions
	acts_as_votable
end
