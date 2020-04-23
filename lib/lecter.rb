# frozen_string_literal: true

require 'lecter/engine' if defined?(Rails::Engine)
require 'lecter/formatter_payload'
require 'lecter/html_generator'
require 'lecter/html_row'
require 'lecter/rack'
require 'lecter/railtie' if defined?(Rails::Railtie)
require 'lecter/requester'
require 'lecter/version'

require 'rest-client'
