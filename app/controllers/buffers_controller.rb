class BuffersController < ApplicationController

	def fund
		@project = Project.find(params[:id])
		# binding.pry
		if params[:buffer][:amount].to_i < @project.budget - @project.funding
			@project.update(funding: @project.funding + params[:buffer][:amount].to_i)
			redirect_to projects_path
			Buffer.create(mecene: current_mecene, project: @project)
		else
			flash[:error] = "Vous ne pouvez pas investir plus que demandé par l'artiste"
			redirect_to project_path(@project.id)
		end
		# if projectject.findparams[]
	end



end