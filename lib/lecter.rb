# frozen_string_literal: true

require 'lecter/engine' if defined?(Rails::Engine)
require 'lecter/formatter_payload'
require 'lecter/html_generator'
require 'lecter/html_row'
require 'lecter/rack'
require 'lecter/railtie' if defined?(Rails::Railtie)
require 'lecter/requester'
require 'lecter/version'
require 'lecter/trace_point'
require 'lecter/formatter_headers'

require 'rest-client'

module Lecter
  AVAILABLE_METHODS = %w[GET POST PUT PATCH DELETE].freeze
  DEFAULT_METHOD = 'GET'
end
