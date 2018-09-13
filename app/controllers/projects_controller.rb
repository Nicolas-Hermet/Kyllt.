require 'google/cloud/storage'
class ProjectsController < ApplicationController
	def index
		@project = Project.all
	end

	def create
		@project = Project.new(post_params)
		@project.artist = current_artist
		@project.funding = 0
		@project.save
		redirect_to projects_path
	end

	def show
		@project = Project.find_by(id: params[:id])
	end

	private

	def post_params
		params.require(:project).permit(:title,
										:description,
										:category,
										:duration,
										:budget,
										:funding,
										:show_fav_place,
										:scope,
										:innovative,
										:validated,
										:archived,
										uploads: [])
	end
end
