class Lecter::Rack
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    if request.params['lecter_analysis']
      thread = Thread.current
      thread[:items] = ''
      tp = TracePoint.new(:line, :class, :call, :c_call, :return) do |tp|
        if tp.path &&
          !tp.path.include?('/app/views') &&
          !tp.path.include?('/app/helpers') &&
          tp.path.include?(Rails.root.to_s) &&
          tp.method_id != :method_added &&
          tp.defined_class != Module &&
          tp.defined_class != Class &&
          tp.defined_class != String &&
          tp.defined_class != Kernel &&
          tp.defined_class != NilClass

          thread[:items] += [tp.path, tp.lineno, tp.defined_class, tp.method_id, tp.event].join(' ') + ';'
        end
      end
      tp.enable
      ActionController::Base.allow_forgery_protection = false
    end
    status, headers, response = @app.call(env)
    if tp
      status = 200
      response = [thread[:items]]
    end

    [status, headers, response]
  ensure
    if tp
      tp.disable
      ActionController::Base.allow_forgery_protection = true
    end
  end
end
