Rails.application.routes.draw do
  devise_for :artists, path: 'artists', controllers: { sessions: "artists/sessions"}
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
