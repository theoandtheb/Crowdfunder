class CommentsController < ApplicationController
	before_filter :load_project

	def index
		@projects = Project.all
		@comments = @project.comments.all
	end

	def show
		@comments = @project.comments.find(params[:id])
	end

	def new
		@comments = @project.comments.all
		@comment = @project.comments.new
	end

	def create
		@comments = @project.comments.all
		@comment = @project.comments.build(comment_params)

		if @comment.save
			render :new
		end
	end

	def edit
		@comments = @project.comments.find(params[:id])
	end

	def update
		@comment = @project.comments.find(params[:id])

		if @comment.update_attributes(comment_params)
			redirect_to project_comment_path(@project, @comment)
		else
			render :edit
		end
	end

	def destroy
		@comment = @project.comments.find(params[:id])
		@comment.destroy
		redirect_to project_comment_path
	end

	private
	def load_project
		@project= Project.find(params[:project_id])
	end

	def comment_params
		params.require(:comment).permit(:body, :commenter)
	end

end
