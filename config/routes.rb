Rails.application.routes.draw do
	
	devise_for :mecenes, path: 'mecenes', controllers: { sessions: "mecenes/sessions", registrations: "mecenes/registrations"}
	devise_for :artists, path: 'artists', controllers: { sessions: "artists/sessions", registrations: "artists/registrations"}

	root 'home#index'

	# get 'home/index'

	resources :projects

	get '/projects/new', to: 'projects#new'

end