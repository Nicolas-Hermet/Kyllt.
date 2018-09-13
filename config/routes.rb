Rails.application.routes.draw do

  # Error routes
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  get 'errors/not_found'
  get 'errors/internal_server_error'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
	devise_for :mecenes, path: 'mecenes', controllers: { sessions: "mecenes/sessions", registrations: "mecenes/registrations"}
	devise_for :artists, path: 'artists', controllers: { sessions: "artists/sessions", registrations: "artists/registrations"}

	root 'home#manifesto'

	get 'home/index'
	resources :artists
	resources :mecenes
	resources :projects
	resources :charges

	get '/projects/new', to: 'projects#new'

	get '/projects', to: "projects#index"
	get '/projects/:id', to: 'projects#show', as: 'show'
	get '/manifesto', to: 'home#manifesto'
	get '/artists/:id', to: "artists#show"
	get '/mecenes/:id', to: "mecenes#show"
	get 'home/simulation'

	# Funding
	post '/buffer/:id', to:'buffers#fund', as: 'fund_this_project'
end
