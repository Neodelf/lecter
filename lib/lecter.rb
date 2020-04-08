require 'lecter/version'
require 'lecter/rack'

require 'lecter/engine' if defined?(::Rails::Engine)

module Lecter
  # autoload :Rack, 'lecter/rack'

  if defined? Rails::Railtie
    class LecterRailtie < Rails::Railtie
      initializer 'lecter.configure_rails_initialization' do |app|
        app.middleware.use Lecter::Rack
      end
    end
  end
end
