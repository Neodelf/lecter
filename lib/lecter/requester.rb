# frozen_string_literal: true

module Lecter
  class Requester
    attr_reader :lines, :error_message

    def initialize(params)
      @method = params[:method]
      @url = params[:url]
      @payload = params[:payload]
      @lines = []
    end

    def call
      return false unless response

      prepare_lines
    rescue URI::InvalidURIError
      @error_message = 'Wrong url'
      false
    rescue RestClient::ExceptionWithResponse => e
      @error_message = e.message
      false
    end

    private

    attr_accessor :method, :url, :payload

    def prepare_lines
      items.each do |item|
        file, line_number = item.split(' ')
        line_number = line_number.to_i

        if line_belongs_to_last?(file)
          lines.last[file] = lines.last[file] << line_number
        else
          lines << { file.to_s => [line_number] }
        end
      end
    end

    def response
      @response ||= RestClient::Request.execute(
        method: method,
        url: url,
        payload: payload
      )
    end

    def items
      @items ||= response.body[3..-1].split(';')
    end

    def line_belongs_to_last?(file)
      lines.last.is_a?(Hash) && lines.last.keys.first.to_s == file
    end
  end
end
