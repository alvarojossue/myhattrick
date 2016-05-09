class PostsController < ApplicationController
	def index
		@the_country = Country.find(params[:country_id])
		@the_team = @the_country.teams.find(params[:team_id])
		@the_posts = @the_team.posts 
		render 'index'
	end

	def new
		@the_country = Country.find(params[:country_id])
		@the_team = @the_country.teams.find(params[:team_id])
		@the_post = @the_team.posts.new
		render 'new'
	end

	def show
		@the_country = Country.find(params[:country_id])
		@the_team = @the_country.teams.find(params[:team_id])
		@the_post = @the_team.posts.find(params[:id])
		render 'show'
	end


	def create
		@the_country = Country.find(params[:country_id])
		@the_team = @the_country.teams.find(params[:team_id])
		@the_post = @the_team.posts.new(post_params)
		if @the_post.save
			redirect_to action: 'index', controller: 'posts', team_id: @the_team.id
		else
			render 'new'
		end
	end

	def edit
		@the_country = Country.find(params[:country_id])
		@the_team = @the_country.teams.find(params[:team_id])
		@the_post = @the_team.posts.find(params[:id])
	end

	def update
		@the_country = Country.find(params[:country_id])
		@the_team = @the_country.teams.find(params[:team_id])
		@the_post = @the_team.posts.find(params[:id])
		if @the_post.update(post_params)
			redirect_to action: 'index', controller: 'posts', team_id: @the_team.id
		else
			render 'edit'
		end
	end

	def destroy
		@the_country = Country.find(params[:country_id])
		@the_team = @the_country.teams.find(params[:team_id])
		@the_post = @the_team.posts.find(params[:id]).destroy
		redirect_to action: 'index', controller: 'posts', team_id: @the_team.id
	end

	private

	def post_params
		params.require(:post).permit(:title, :image_url, :date, :author, :content, :source)
	end
end
