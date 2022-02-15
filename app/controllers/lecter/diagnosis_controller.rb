# frozen_string_literal: true

module Lecter
  class DiagnosisController < ActionController::Base
    layout 'lecter'
    before_action :format_request_data, only: :create

    def new; end

    def show
      redirect_to new_diagnosis_path
    end

    def create
      requester = Lecter::Requester.new(requester_params)
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
      params.permit(:endpoint, :body_raw, :method, :headers)
    end

    def requester_params
      {
        method: diagnosis_params[:method].downcase.to_sym,
        url: diagnosis_params[:endpoint],
        payload: formatter_payload.result,
        headers: formatted_headers.result
      }
    end

    def format_request_data
      formatters = [formatter_payload, formatted_headers]
      return if formatters.all?(&:call)

      flash[:error] = formatters.map(&:error_message).join(', ')
      render :new
    end

    def formatter_payload
      @formatter_payload ||= Lecter::FormatterPayload.new(diagnosis_params[:body_raw])
    end

    def formatted_headers
      @formatted_headers ||= Lecter::FormatterHeaders.new(diagnosis_params[:headers])
    end
  end
end
