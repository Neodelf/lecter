module Lecter
  class Requester
    attr_reader :lines, :error_message

    def initialize(params)
      @method = params[:method]
      @url = params[:url]
      @payload = params[:payload]
    end

    def call
      response = RestClient::Request.execute(
        method: method,
        url: url,
        payload: payload
      )
      return false unless response

      prepare_lines(response.body)
    rescue URI::InvalidURIError
      @error_message = 'Wrong url'
      false
    rescue RestClient::ExceptionWithResponse => e
      @error_message = e.message
      false
    end

    private

    attr_accessor :method, :url, :payload

    def prepare_lines(response_body)
      @lines = []
      response_status = response_body[0..2]
      items = response_body[3..-1].split(';')
      items.each do |item|
        file = item.split(' ')[0]
        if lines.last.is_a?(Hash) && lines.last.keys.first.to_s == file
          lines.last[file] = lines.last[file] << item.split(' ')[1].to_i
        else
          lines << {"#{file}" => [item.split(' ')[1].to_i]}
        end
      end
      lines
    end
  end
end
