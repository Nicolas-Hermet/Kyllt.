class MecenesController < ApplicationController
	def index
	end

	def show
		@buffer = Buffer.where(mecene: current_mecene)
		@project = Project.all
		@arr = Hash.new
		@buffer.each do |b|
			@arr[@project.find(b.project_id)] = 0
		end
		@buffer.each do |b|
			@arr[@project.find(b.project_id)] += b.invest
		end
	end
end