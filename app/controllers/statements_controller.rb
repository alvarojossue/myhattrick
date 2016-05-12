class StatementsController < ApplicationController


	def index
		@the_team = Team.find(params[:team_id])
		@the_statements = @the_team.statements 
		render 'index'
	end

	def new
		@the_team = Team.find(params[:team_id])
		@the_statement = @the_team.statements.new
		render 'new'
	end

	def show
		@the_team = Team.find(params[:team_id])
		@the_statement = @the_team.statements.find(params[:id])
		render 'show'
	end


	def create
		@the_team = Team.find(params[:team_id])
		@the_statement = @the_team.statements.new(statement_params)
		if @the_statement.save
			redirect_to action: 'index', controller: 'statements', team_id: @the_team.id
		else
			render 'new'
		end
	end

	def edit
		@the_team = Team.find(params[:team_id])
		@the_statement = @the_team.statements.find(params[:id])
	end

	def update
		@the_team = Team.find(params[:team_id])
		@the_statement = @the_team.statements.find(params[:id])
		if @the_statement.update(statement_params)
			redirect_to action: 'index', controller: 'statements', team_id: @the_team.id
		else
			render 'edit'
		end
	end

	def destroy
		@the_team = Team.find(params[:team_id])
		@the_statement = @the_team.statements.find(params[:id]).destroy
		redirect_to action: 'index', controller: 'statements', team_id: @the_team.id
	end

	def agree
		the_statement = Statement.find(params[:id])
		all_comments = the_statement.comment_threads
		the_statement.upvote_from current_user
		render json: {the_statement: the_statement, likes: the_statement.get_upvotes.size, dislikes: the_statement.get_downvotes.size, total: the_statement.votes_for.size, comments: all_comments}

	end

	def disagree
		the_statement = Statement.find(params[:id])
		all_comments = the_statement.comment_threads
		the_statement.downvote_from current_user
		render json: {the_statement: the_statement, likes: the_statement.get_upvotes.size, dislikes: the_statement.get_downvotes.size, total: the_statement.votes_for.size, comments: all_comments }
	end

	def comment
		the_statement = Statement.find(params[:id])
		the_user = current_user
		content = params[:content]
		comment = Comment.build_from(the_statement, the_user.id, "#{content}")
		comment.save
		all_comments = the_statement.comment_threads
		render json: {comments: all_comments}
	end

	private

	def statement_params
		params.require(:statement).permit(:title, :image_url, :date, :author, :description)
	end
end
