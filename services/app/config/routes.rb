# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root 'welcome#index' # main page

    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'

    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'

    resources :companies, only: [:index, :show, :update]
    resources :departments, only: [:index, :show, :update] do
      resources :employees, shallow: true
    end
    resources :employees, only: [:index, :show, :new, :edit, :create, :update] do
      scope module: :employees do
        resources :workdays, only: [:index, :create, :update]
      end
    end

    get '/employees', to: 'employees#show_all'

    get '/request_report', to: 'reports#index'
    get '/report', to: 'reports#show'

    resource :home, only: [:show]
  end

  match '*path', to: 'application#not_found', via: :all
end
