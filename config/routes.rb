Rails.application.routes.draw do
  get 'downgrade/new'

  get 'downgrade/create'

  get 'charges/create'

  get 'charges/new'

  resources :wikis
  resources :charges, only: [:new, :create]
  resources :downgrade, only: [:new, :create]

  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  devise_scope :user do
    authenticated :user do
    root 'welcome#index', as: :authenticated_root
  end

    unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
