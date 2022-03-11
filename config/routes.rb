# frozen_string_literal: true

Rails.application.routes.draw do
  resources :repositories, only: [:index]

  root 'repositories#index'
end
