class ProjectController < ApplicationController

	def create
		@project = Project.create
	end

end