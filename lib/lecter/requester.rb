# frozen_string_literal: true

module Lecter
  class Requester
    WRONG_URL_MSG = 'Wrong url'

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
      @error_message = WRONG_URL_MSG
      false
    rescue HTTP::Error => e
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
      @response ||= HTTP.public_send(method, url, body: payload.to_json)
    end

    def items
      @items ||= response.body.to_s[3..-1].split(';')
    end

    def line_belongs_to_last?(file)
      lines.last.is_a?(Hash) && lines.last.keys.first.to_s == file
    end
  end
end
