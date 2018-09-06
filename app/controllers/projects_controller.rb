class ProjectsController < ApplicationController
	def index
		@project = Project.all
	end

	def new
	end

	def create
		@project = Project.create(project_params)
	end
	def create
		project = User.create(title: params[:project][:title], description: params[:project][:description], category: params[:project][:category], duration: params[:project][:duration], budget: params[:project][:budget], show_fav_place: params[:project][:show_fav_place], scope: params[:project][:scope], innovative: params[:project][:innovative])
	end
end