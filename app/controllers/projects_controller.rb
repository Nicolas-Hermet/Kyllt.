class ProjectsController < ApplicationController
	def new
	end

	def create
		@project = Project.new(project_params)
	end

	private

	def project_params
	params.require(:project).permit(:title, :description, :category, :duration, :budget, :show_fav_place, :scope, :innovative)
	end
end