class ProjectsController < ApplicationController
	def index
		@project = Project.all
	end

	def create
	  	puts
	  	puts
		puts "11111111111111111"
	  	puts
	  	puts
	  	puts post_params
	  	puts
	  	# puts params[:project][:avatar].tempfile
	  	# puts 
	  	# puts params.inspect
	  	# puts
	  	puts
	  	puts "22222222222222222"
	  	puts
	  	puts
		# @project = Project.create(artist: current_artist,
		# 			   title: params[:project][:title],
		# 			   description: params[:project][:description],
		# 			   category: params[:project][:category],
		# 			   duration: params[:project][:duration],
		# 			   budget: params[:project][:budget],
		# 			   funding: params[:project][:funding],
		# 			   show_fav_place: params[:project][:show_fav_place],
		# 			   scope: params[:project][:scope],
		# 			   innovative: params[:project][:innovative],
		# 			   avatar: params[:project][:avatar]
		# 			   )
		@project = Project.new(post_params)
		@project.artist = current_artist
		@project.save
		# @project.avatar = params[:project][:avatar]
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
										uploads: []
										)
	end
end