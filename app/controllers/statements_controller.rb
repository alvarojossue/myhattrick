class StatementsController < ApplicationController
	def index
		@the_country = Country.find(params[:country_id])
		@the_team = @the_country.teams.find(params[:team_id])
		@the_statements = @the_team.statements 
		render 'index'
	end

	def new
		@the_country = Country.find(params[:country_id])
		@the_team = @the_country.teams.find(params[:team_id])
		@the_statement = @the_team.statements.new
		render 'new'
	end

	def show
		@the_country = Country.find(params[:country_id])
		@the_team = @the_country.teams.find(params[:team_id])
		@the_statement = @the_team.statements.find(params[:id])
		render 'show'
	end


	def create
		@the_country = Country.find(params[:country_id])
		@the_team = @the_country.teams.find(params[:team_id])
		@the_statement = @the_team.statements.new(statement_params)
		if @the_statement.save
			redirect_to action: 'index', controller: 'statements', team_id: @the_team.id
		else
			render 'new'
		end
	end

	def edit
		@the_country = Country.find(params[:country_id])
		@the_team = @the_country.teams.find(params[:team_id])
		@the_statement = @the_team.statements.find(params[:id])
	end

	def update
		@the_country = Country.find(params[:country_id])
		@the_team = @the_country.teams.find(params[:team_id])
		@the_statement = @the_team.statements.find(params[:id])
		if @the_statement.update(statement_params)
			redirect_to action: 'index', controller: 'statements', team_id: @the_team.id
		else
			render 'edit'
		end
	end

	def destroy
		@the_country = Country.find(params[:country_id])
		@the_team = @the_country.teams.find(params[:team_id])
		@the_statement = @the_team.statements.find(params[:id]).destroy
		redirect_to action: 'index', controller: 'statements', team_id: @the_team.id
	end

	private

	def statement_params
		params.require(:statement).permit(:title, :image_url, :date, :author, :description)
	end
end
