class ReactionsController < ApplicationController
	def index
		@the_country = Country.find(params[:country_id])
		@the_team = @the_country.teams.find(params[:team_id])
		@the_statement = @the_team.statements.find(params[:statement_id])
		@the_reactions = @the_statement.reactions
		render json: reactions
	end

	def create
		@the_country = Country.find(params[:country_id])
		@the_team = @the_country.teams.find(params[:team_id])
		@the_statement = @the_team.statements.find(params[:statement_id])
		@the_reaction = @the_statement.reactions.create(reaction_params)
		render json: reaction
	end

	def show
		@the_country = Country.find(params[:country_id])
		@the_team = @the_country.teams.find(params[:team_id])
		@the_statement = @the_team.statements.find(params[:statement_id])
		@the_reaction = @the_statement.reactions.find(params[:id])
		unless reaction 
			render json: {error: "no reaction found"}
			status: 404
			return
		end
		render json: reaction
	end

	private
	def reaction_params
		params.require(:reaction).permit(:answer, :comment)
	end

end
