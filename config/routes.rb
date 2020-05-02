Rails.application.routes.draw do
  # get '/birds' => 'birds#index'
  # get '/birds' => 'birds#show'

  resources :birds, only: [:show, :index]
end