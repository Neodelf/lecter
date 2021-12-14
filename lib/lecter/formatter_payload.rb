# frozen_string_literal: true

require 'json'

module Lecter
  class FormatterPayload
    WRONG_PARAMETERS_MSG = 'Wrong parameters'
    attr_reader :result, :error_message

    def initialize(payload)
      @dirty_payload = payload
    end

    def call
      @result = json_parse(dirty_payload).merge(lecter_enabled_parameter)
    rescue JSON::ParserError
      @error_message = WRONG_PARAMETERS_MSG
      false
    end

    private

    attr_accessor :dirty_payload

    def json_parse(string)
      string = '{' + string + '}' unless string.match(/\A{.*}\z/)
      string.gsub!('=>', ':')&.gsub!(/(“|”)/, '"')
      JSON.parse(string)
    end

    def lecter_enabled_parameter
      { lecter_enabled: true }
    end
  end
end
