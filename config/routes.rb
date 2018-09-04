Rails.application.routes.draw do
	devise_for :mecenes, path: 'mecenes', controllers: { sessions: "mecenes/sessions"}
	devise_for :artists, path: 'artists', controllers: { sessions: "artists/sessions"}
	
	root 'home#index'

	get 'home/index'
end