class ReactionsController < ApplicationController
	def index
		@the_country = Country.find(params[:country_id])
		@the_team = @the_country.teams.find(params[:team_id])
		@the_statement = @the_team.statements.find(params[:statement_id])
		@the_reactions = @the_statement.reactions
		render 'index'
	end

	def new
		@the_country = Country.find(params[:country_id])
		@the_team = @the_country.teams.find(params[:team_id])
		@the_statement = @the_team.statements.find(params[:statement_id])
		@the_reaction = @the_statement.reactions.new
		render 'new'
	end

	def show
		@the_country = Country.find(params[:country_id])
		@the_team = @the_country.teams.find(params[:team_id])
		@the_statement = @the_team.statements.find(params[:statement_id])
		@the_reaction = @the_statement.reactions.find(params[:id])
		render 'show'
	end

	def create
		@the_country = Country.find(params[:country_id])
		@the_team = @the_country.teams.find(params[:team_id])
		@the_statement = @the_team.statements.find(params[:statement_id])
		@the_reaction = @the_statement.reactions.new(reaction_params)
		if @the_reaction.save
			redirect_to action: 'index', controller: 'reactions', statement_id: @the_statement.id 
		else
			render 'new'
		end
	end

	private
	def reaction_params
		params.require(:reaction).permit(:answer, :comment)
	end

end
