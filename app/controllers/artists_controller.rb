class ArtistsController < ApplicationController
	def index
	end

	def show
		@project = Project.find_by(artist: current_artist)
	end
end