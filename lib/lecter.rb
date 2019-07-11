require "lecter/version"

module Lecter
  class Error < StandardError; end

  class Engine < ::Rails::Engine
  end

  autoload :Rack, 'lecter/rack'

  if defined? Rails::Railtie
    class LecterRailtie < Rails::Railtie
      initializer 'lecter.configure_rails_initialization' do |app|
        app.middleware.use Lecter::Rack
      end
    end
  end
end
