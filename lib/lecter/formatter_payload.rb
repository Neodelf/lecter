# frozen_string_literal: true

module Lecter
  class FormatterPayload
    attr_reader :result, :error_message

    def initialize(payload)
      @dirty_payload = payload
    end

    def call
      @result = json_parse(dirty_payload).merge(lecter_analysis_parameter)
    rescue JSON::ParserError
      @error_message = 'Wrong parameters'
      false
    end

    private

    attr_accessor :dirty_payload

    def json_parse(string)
      string = '{' + string + '}' unless string.match(/\A{.*}\z/)
      string.gsub!('=>', ':')&.gsub!(/(“|”)/, '"')
      JSON.parse(string)
    end

    def lecter_analysis_parameter
      { lecter_analysis: true }
    end
  end
end
