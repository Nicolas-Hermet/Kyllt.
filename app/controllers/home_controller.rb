class HomeController < ApplicationController
	def simulate
        if !params[:simu].nil?
            binding.pry
            @result = params[:simu][:investissement].to_f/params[:simu][:budget].to_f*0.45*params[:simu][:vente].to_f
            @part_societe = params[:simu][:investissement].to_f/params[:simu][:budget].to_f*0.45*100
            # redirect_to simulation_path
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
end