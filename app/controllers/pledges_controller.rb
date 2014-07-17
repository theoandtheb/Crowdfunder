class PledgesController < ApplicationController
	before_filter :load_project

	def	index
		@projects = Project.all
		@pledges = @project.pledges.all
	end

	def show
		@pledges = @project.pledges.find(params[:id])

		if current_user
			# Check for all active pledges for the current user.
		end
	end

	def new
		@pledges = @project.pledges.all
		@pledge = @project.pledges.new
	end

	def create
		@pledges = @project.pledges.all
		@pledge = @project.pledges.build(pledge_params)

		if @pledge.save
			render :new
		end
	end

	def edit
		@pledge = @project.pledges.find(params[:id])
	end

	def update
		@pledge = @project.pledges.find(params[:id])

		if @pledge.update_attributes(pledge_params)
			redirect_to project_pledge_path(@project, @pledge)
		else
			render :edit
		end
	end

	def destroy
		@pledge = @project.pledges.find(params[:id])
		@pledge.destroy
		redirect_to project_pledge_path
	end

	private 
	def load_project
		@project= Project.find(params[:project_id])
	end

	def pledge_params
		params.require(:pledge).permit(:amount, :project_id, :user_id)
	end
end

# =====================

# Pledge Views

# Index:  List of pledges (specific to the user), with a total of all active pledges.
# Show:  details of a particular pledge (project name and summary, amount pledged with associated breakpoints/reqards).
# New + Create:  create a new pledge (display list of available project titles, amount to pledge).
# Edit + Update:  edit a project's pledge amount (but NOT the project's title).
# Delete:  user can delete their pledge.  Ask for confirmation before showing a message indicating deletion, then redirect to the updated Index (list of pledges). 
