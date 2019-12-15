Rails.application.routes.draw do
  root 'songs#index'
  resources :songs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/songs/:id/edit', to: 'songs#edit', as: 'edit_song'
  patch '/songs/:id', to: 'songs#update'

end
