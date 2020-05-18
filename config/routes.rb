# frozen_string_literal: true

Lecter::Engine.routes.draw do
  get '/', to: 'diagnosis#show'
  get '/new', to: 'diagnosis#new'
  post '/', to: 'diagnosis#create'
end
