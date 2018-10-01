class HomeController < ApplicationController
	def simulate
    if !params[:simu].nil?
    	@investissement = params[:simu][:investissement].to_f
    	@budget = params[:simu][:budget].to_f
    	@vente = params[:simu][:vente].to_f
        @result = params[:simu][:investissement].to_f/params[:simu][:budget].to_f*0.45*params[:simu][:vente].to_f
        @part_societe = params[:simu][:investissement].to_f/params[:simu][:budget].to_f*0.45*100
    end
  end

	def simulation_results
		unless params[:simu].nil?
			@investissement = simu_params[:investissement].to_f
			@budget = simu_params[:budget].to_f
			@vente = simu_params[:vente].to_f
			@result = simu_params[:investissement].to_f/simu_params[:budget].to_f*0.45*simu_params[:vente].to_f
			@part_societe = simu_params[:investissement].to_f/simu_params[:budget].to_f*0.45*100

			respond_to do |format|
				format.js
			end
		end
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

	private

	def simu_params
		params.require(:simu).permit(:investissement, :budget, :vente)
	end
end
