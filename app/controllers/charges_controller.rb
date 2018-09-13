class ChargesController < ApplicationController
	def new
	end

	def create
	  @amount = params[:amount]

	  @amount = @amount.gsub('€', '').gsub(',', '')

	  begin
	    @amount = Float(@amount).round(2)
	  rescue
	    flash[:error] = 'Financement interrompu. Veuillez rentrer un montant valide en euros (€).'
	    redirect_to project_path(Project.find(params[:id]))
	    return
	  end

	  @amount = (@amount * 100).to_i # Must be an integer!
	  begin
		  if @amount < 10000
		    flash[:error] = 'Finacement interrompu. Vous ne pouvez donner que 100€ minimum'
		    redirect_to project_path(Project.find(params[:id]))
		    return
		  end

		  Stripe::Charge.create(
		    :amount => @amount,
		    :currency => 'eur',
		    :source => params[:stripeToken],
		    :description => 'Votre financement'
		  )

	  rescue Stripe::CardError => e
	    flash[:error] = e.message
	    redirect_to project_path(Project.find(params[:id]))
	  end

	  update_tables(@amount/100, params[:id])
	end

	private

	def update_tables(amount, id)
		@project = Project.find(id)
		if current_mecene
			@mecene = current_mecene
		else
			flash[:error] = "Un problème d'identification est survenu, veuillez-nous contacter."
		end
		Buffer.create(mecene: @mecene, project: @project, invest: amount)
		@project.update(funding: amount+@project.funding)
	end
end
