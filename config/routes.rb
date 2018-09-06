Rails.application.routes.draw do

	devise_for :mecenes, path: 'mecenes', controllers: { sessions: "mecenes/sessions", registrations: "mecenes/registrations"}
	devise_for :artists, path: 'artists', controllers: { sessions: "artists/sessions", registrations: "artists/registrations"}

	root 'home#manifesto'

	get 'home/index'

	resources :projects

	get '/projects/new', to: 'projects#new'

	get '/projects', to: "projects#index"
	get '/projects/:id', to: 'projects#show', as: 'show'
	get '/manifesto', to: 'home#manifesto'
end
