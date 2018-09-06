Rails.application.routes.draw do
	
	devise_for :mecenes, path: 'mecenes', controllers: { sessions: "mecenes/sessions", registrations: "mecenes/registrations"}
	devise_for :artists, path: 'artists', controllers: { sessions: "artists/sessions", registrations: "artists/registrations"}

	root 'home#index'

	resources :artists
	resources :projects

	get '/projects/new', to: 'projects#new'
	
	get '/projects', to: "projects#index"
	get '/projects/:id', to: 'projects#show', as: 'show'

	get '/artists/:id', to: "artists#show"

end