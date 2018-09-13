class ArtistsController < ApplicationController
	def index
	end

	def show
		@project = Project.where(artist: current_artist).last
	end
end