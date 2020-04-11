# frozen_string_literal: true

require 'lecter/formatter_payload'
require 'lecter/html_generator'
require 'lecter/version'
require 'lecter/rack'

require 'lecter/engine' if defined?(Rails::Engine)
require 'lecter/railtie' if defined?(Rails::Railtie)
