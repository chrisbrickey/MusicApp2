Rails.application.routes.draw do
  get 'tracks/create'

  get 'tracks/edit'

  get 'tracks/show'

  get 'tracks/update'

  get 'tracks/destroy'

  get 'tracks/new'

  get 'notes/create'

  get 'notes/destroy'

  get 'bands/create'

  get 'bands/new'

  get 'bands/edit'

  get 'bands/show'

  get 'bands/update'

  get 'bands/destroy'

  get 'albums/create'

  get 'albums/edit'

  get 'albums/show'

  get 'albums/update'

  get 'albums/destroy'

  get 'albums/new'

  get 'users/activate'

  get 'users/create'

  get 'users/new'

  get 'users/show'

  get 'sessions/new'

  get 'sessions/destroy'

  get 'sessions/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :show] do
    get :activate, on: :collection
  end

  resources :albums, only: [:create, :show, :edit, :update, :destroy] do
    resources :tracks, only: [:new]
  end

  resources :bands do
    resources :albums, only: [:new]
  end

  resources :notes, only: [:create, :destroy]

  resources :tracks, only: [:create, :show, :edit, :update, :destroy]

end
