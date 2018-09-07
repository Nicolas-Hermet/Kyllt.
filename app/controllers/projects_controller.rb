require 'google/cloud/storage'
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
		binding.pry
		@project.save
		# binding.pry
		# storage = Google::Cloud::Storage.new(
		# project_id: "teamx-art"
  #     # credentials: "/home/nico/Bureau/temp/debrouille/thp-s06-mardi-ace5327bc7ed.json"
  #     # credentials: Rails.application.credentials.dig(:file, :google_json_file)  # NOP
  #      # credentials: (Rails.application.credentials.dig(:gcs)).to_json  # NOP
  #     # credentials: "./google.api.json" # NOP
  #   )
  #   bucket = storage.bucket "teamx-art-bucket"
  #   file = bucket.create_file params[:project][:uploads][0].tempfile, "Projects/"+params[:project][:uploads][0].original_filename

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
