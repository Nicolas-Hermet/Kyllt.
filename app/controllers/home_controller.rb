class HomeController < ApplicationController

	def simulate
		@result = (:investissement/:budget)*0.45*:vente
		@part_societe = ((:investissement/:budget)*0.45)*100)
		redirect_to 
	end

	def index
		@funded = Project.where("funding = budget").count
		@artists = Artist.count
		@mecenes = Mecene.count
		@distributed_dividends = 0
		project = Project.all
		project.each do |p|
			@distributed_dividends += p.funding
		end
	end

	def manifesto

	end
end