# frozen_string_literal: true

module Lecter
  class FormatterHeaders
    WRONG_HEADERS_MSG = 'Wrong headers'
    attr_reader :result, :error_message

    def initialize(headers)
      @dirty_headers = headers
    end

    def call
      @result = dirty_headers
                .split(',')
                .map { |header_with_value| header_with_value.split('=') }
                .to_h
    rescue StandardError
      @error_message = WRONG_HEADERS_MSG
      false
    end

    private

    attr_accessor :dirty_headers
  end
end
