# frozen_string_literal: true

module Lecter
  class Rack
    def initialize(app)
      @app = app
    end

    def call(env)
      request = ::Rack::Request.new(env)
      if request.params['lecter_analysis']
        thread = Thread.current
        thread[:items] = ''
        tp = TracePoint.new(:line, :class, :call, :c_call, :return) do |trace_point|
          if trace_point.path &&
             trace_point.path.exclude?('/app/views') &&
             trace_point.path.exclude?('/app/helpers') &&
             trace_point.path.include?(Rails.root.to_s) &&
             trace_point.method_id != :method_added &&
             trace_point.defined_class != Module &&
             trace_point.defined_class != Class &&
             trace_point.defined_class != String &&
             trace_point.defined_class != Kernel &&
             trace_point.defined_class != NilClass

            thread[:items] += [
              trace_point.path,
              trace_point.lineno,
              trace_point.defined_class,
              trace_point.method_id,
              trace_point.event
            ].join(' ') + ';'
          end
        end
        tp.enable
        ActionController::Base.allow_forgery_protection = false
      end

      status, headers, response = @app.call(env)

      if tp
        response = [status.to_s + thread[:items]]
        status = 200
        headers = {}
      end

      [status, headers, response]
    ensure
      if tp
        tp.disable
        ActionController::Base.allow_forgery_protection = true
        Thread.current[:items] = nil
      end
    end
  end
end
