class ArtistsController < ApplicationController
	def index
		@artist = current_artist
	end

	def show
		@artist = Artist.find_by(id: params[:id])
		@project = Project.find_by(artist: current_artist)
	end
end