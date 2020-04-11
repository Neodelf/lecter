# frozen_string_literal: true

module Lecter
  class LecterRailtie < Rails::Railtie
    initializer 'lecter.configure_rails_initialization' do |app|
      app.middleware.use Lecter::Rack
    end
  end
end
