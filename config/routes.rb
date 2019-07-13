Lecter::Engine.routes.draw do
  resource :diagnosis, only: %i[show create new], controller: :diagnosis
end
