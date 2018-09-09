class ApplicationController < ActionController::Base
	before_action :sanitize_devise_params, if: :devise_controller?

	def sanitize_devise_params
		devise_parameter_sanitizer.permit(:sign_up, keys:[:first_name,
														  :last_name,
														  :gcs_read])
		devise_parameter_sanitizer.permit(:account_update, keys:[:first_name,
																:last_name,
																:gcs_read,
																:avatar,
																:email,
														  		:first_name,
														  		:last_name,
														  		:min_budget,
														  		:max_return_invest,
														  		:art_category,
														  		:locality,
														  		:iban,
															    :school,
															    :previous_projects,
															    :previous_exhibitions,
															    :previous_sales,
															    :time_invest_on_project,
															    :biography,
														  		:avatar])
	end
end