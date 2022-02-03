# frozen_string_literal: true

Lecter::Engine.routes.draw do
  root 'diagnosis#new'

  resource :diagnosis, only: %w[new create show], controller: :diagnosis
end
