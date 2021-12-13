# frozen_string_literal: true

Lecter::Engine.routes.draw do
  resource :diagnosis, only: %w[new create show], controller: :diagnosis
end
