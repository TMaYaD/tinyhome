# frozen_string_literal: true

Rails.application.routes.draw do
  resources :device_configurations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'device_configurations#index'
end
