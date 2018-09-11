class ChargesController < ApplicationController
	def new
	end

	def create
	  @amount = params[:amount]

	  @amount = @amount.gsub('$', '').gsub(',', '')

	  begin
	    @amount = Float(@amount).round(2)
	  rescue
	    flash[:error] = 'Charge not completed. Please enter a valid amount in USD ($).'
	    redirect_to new_charge_path
	    return
	  end

	  @amount = (@amount * 100).to_i # Must be an integer!
	  begin
		  if @amount < 500
		    flash[:error] = 'Charge not completed. Donation amount must be at least $5.'
		    redirect_to new_charge_path
		    return
		  end

		  Stripe::Charge.create(
		    :amount => @amount,
		    :currency => 'usd',
		    :source => params[:stripeToken],
		    :description => 'Custom donation'
		  )

	  rescue Stripe::CardError => e
	    flash[:error] = e.message
	    redirect_to new_charge_path
	  end

	  update_tables(@amount/100, params[:id])
	end

	private

	def update_tables(amount, id)
		@project = Project.find(id)
		if current_mecene
			@mecene = current_mecene
		else
			flash[:error] = "Un problème d'identification est survenu"
		end
		Buffer.create(mecene: @mecene, project: @project, invest: amount)
		@project.update(funding: amount)
	end
end
