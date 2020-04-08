# frozen_string_literal: true

Lecter::Engine.routes.draw do
  resource :diagnosis, only: %i[show create new], controller: :diagnosis
end
