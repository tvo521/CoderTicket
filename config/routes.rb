Rails.application.routes.draw do
  root 'events#index'

  resources :events do
    post 'search', on: :collection, controller: 'events', action: 'index'

    resources :tickets
  end

  resources :sessions

  resources :users
end
