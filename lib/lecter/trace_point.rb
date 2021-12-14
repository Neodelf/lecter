# frozen_string_literal: true

module Lecter
  class TracePoint
    def build
      tp = ::TracePoint.new(:line, :class, :call, :c_call, :return) do |trace_point|
        if trace_point.path&.exclude?('/app/views') &&
           trace_point.path&.exclude?('/app/helpers') &&
           trace_point.path&.include?(Rails.root.to_s) &&
           trace_point.method_id != :method_added &&
           trace_point.defined_class != Module &&
           trace_point.defined_class != Class &&
           trace_point.defined_class != String &&
           trace_point.defined_class != Kernel &&
           trace_point.defined_class != NilClass

          Thread.current[:items] += [
            trace_point.path,
            trace_point.lineno,
            trace_point.defined_class,
            trace_point.method_id,
            trace_point.event
          ].join(' ') + ';'
        end
      end

      tp
    end
  end
end
