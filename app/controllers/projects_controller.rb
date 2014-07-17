class ProjectsController < ApplicationController
	before_filter :require_login, only: [:new, :create]

	def index
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
		@pledge = @project.pledges.new
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to projects_url
		else
			render :new
		end
	end

private
	def project_params
		params.require(:project).permit(:title, :description, :goal, :start_date, :end_date, :category, rewards_attributes: [:amount, :description])
	end
end
