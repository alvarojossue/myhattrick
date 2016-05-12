class Statement < ActiveRecord::Base
	belongs_to :team
	acts_as_votable
	acts_as_commentable
end
