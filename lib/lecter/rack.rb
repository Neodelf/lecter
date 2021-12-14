# frozen_string_literal: true

module Lecter
  class Rack
    def initialize(app)
      @app = app
      @tp = Lecter::TracePoint.new.build
    end

    def call(env)
      if ::Rack::Request.new(env).params['lecter_enabled']
        thread = Thread.current
        thread[:items] = ''
        tp.enable
        ActionController::Base.allow_forgery_protection = false
      end

      status, headers, response = @app.call(env)

      if tp.enabled?
        response = [status.to_s + thread[:items]]
        status = 200
        headers = {}
      end

      [status, headers, response]
    ensure
      if tp.enabled?
        tp.disable
        ActionController::Base.allow_forgery_protection = true
        Thread.current[:items] = nil
      end
    end

    private

    attr_reader :tp
  end
end
