# frozen_string_literal: true

require 'rest-client'
require 'lecter/requester'
require 'lecter/formatter_payload'
require 'lecter/html_generator'

module Lecter
  class DiagnosisController < ActionController::Base
    layout 'lecter'
    before_action :format_payload, only: :create

    def new; end

    def show
      redirect_to new_diagnosis_path
    end

    def create
      requester = Lecter::Requester.new(
        method: diagnosis_params[:method].downcase.to_sym,
        url: diagnosis_params[:endpoint],
        payload: formatter_payload.result
      )
      if requester.call
        @file_listings = HtmlGenerator.new(requester.lines).call
        render :show
      else
        flash[:error] = requester.error_message
        render :new
      end
    end

    private

    def diagnosis_params
      params.permit(:endpoint, :params, :method)
    end

    def format_payload
      unless formatter_payload.call
        flash[:error] = formatter_payload.error_message
        render :new
      end
    end

    def formatter_payload
      @formatted_payload ||= Lecter::FormatterPayload.new(diagnosis_params[:params])
    end
  end
end
