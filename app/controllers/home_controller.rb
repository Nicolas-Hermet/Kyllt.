class HomeController < ApplicationController
	def simulate
		@result = (:investissement/:budget)*0.45*:vente
		@part_societe = ((:investissement/:budget)*0.45)*100)
		redirect_to 
	end
end