Rails.application.routes.draw do
	devise_for :mecenes
	get 'home/index'
	root 'home#index'
end