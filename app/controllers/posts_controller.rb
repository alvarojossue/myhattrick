class PostsController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@the_team = current_user.team
		@the_posts = @the_team.posts
		render 'index'
	end

	def new
		@the_team = current_user.team
		@the_post = @the_team.posts.new
		render 'new'
	end

	def show
		@the_team = current_user.team
		@the_post = @the_team.posts.find(params[:id])
		render 'show'
	end


	def create
		@the_team = current_user.team

		scraper = Webscrapper.new(params[:url])
		@title = scraper.get_title
		@image = scraper.get_image
		@author = scraper.get_author
		@date = scraper.get_date
		@content = scraper.get_content


		@the_post = @the_team.posts.new(title: @title, image_url: @image, author: @author, date: @date, content: @content, source: "Marca")
		if @the_post.save
			redirect_to action: 'index', controller: 'posts', team_id: @the_team.id
		else
			render 'new'
		end
	end

	def edit
		@the_team = current_user.team
		@the_post = @the_team.posts.find(params[:id])
	end

	def update
		@the_team = current_user.team
		@the_post = @the_team.posts.find(params[:id])
		if @the_post.update(post_params)
			redirect_to action: 'index', controller: 'posts', team_id: @the_team.id
		else
			render 'edit'
		end
	end

	def destroy
		@the_team = current_user.team
		@the_post = @the_team.posts.find(params[:id]).destroy
		redirect_to action: 'index', controller: 'posts', team_id: @the_team.id
	end

	private

	def post_new_params

	end

	def post_params
		params.require(:post).permit(:title, :image_url, :date, :author, :content, :source)
	end
end
