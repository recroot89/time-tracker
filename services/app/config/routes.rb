# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root 'welcome#index' # main page
  end

  match '*path', to: 'application#not_found', via: :all
end
