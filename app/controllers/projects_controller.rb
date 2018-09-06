class ProjectsController < ApplicationController
	def index
		@project = Project.all
	end

	def create
		Project.create(artist: current_artist, title: params[:xoxo][:title], description: params[:xoxo][:description], category: params[:xoxo][:category], duration: params[:xoxo][:duration], budget: params[:xoxo][:budget], funding: params[:xoxo][:funding], show_fav_place: params[:xoxo][:show_fav_place], scope: params[:xoxo][:scope], innovative: params[:xoxo][:innovative])
		redirect_to root_path
	end

	def show
		@project = Project.find_by(id: params[:id])
	end

	def post_params
		params.require(:project).permit(uploads: [])
	end
end
