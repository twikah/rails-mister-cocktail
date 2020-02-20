Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'

  resources :doses, only: [:destroy]

  resources :cocktails, except: [:edit, :update, :destroy] do
    resources :doses, only: [:new, :create]
  end
end
