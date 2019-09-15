# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root 'welcome#index' # main page

    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'

    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'

    resources :companies, only: [:show, :update]
    resources :departments, only: [:index, :show, :update]

    resource :home, only: [:show]
  end

  match '*path', to: 'application#not_found', via: :all
end
