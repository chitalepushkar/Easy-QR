Rails.application.routes.draw do
  get 'home/index'
  get 'home/new'
  post 'home/create'
  get 'home/new_upload'
  post 'home/upload'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
