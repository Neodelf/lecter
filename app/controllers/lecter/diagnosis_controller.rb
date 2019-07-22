require 'rest-client'
require 'slim-rails'

module Lecter
  class DiagnosisController < ActionController::Base
    before_action :format_params, only: :create

    def new
    end

    def show
      redirect_to new_diagnosis_path
    end

    def create
      response =
        case diagnosis_method
        when 'get'
          ::RestClient.get(diagnosis_params[:endpoint], params: format_params)
        when 'post'
          ::RestClient.post(diagnosis_params[:endpoint], format_params)
        end

      return render :new unless response

      prepare_data(response.body)
      render :show
    rescue URI::InvalidURIError
      flash[:error] = 'Wrong url'
      return render :new
    end

    private

    def diagnosis_params
      params.permit(:endpoint, :params, :method)
    end

    def prepare_data(response_body)
      @lines = []
      @response_status = response_body[0..2]
      @items = response_body[3..-1].split(';')
      @items.each do |item|
        file = item.split(' ')[0]
        if @lines.last.is_a?(Hash) && @lines.last.keys.first.to_s == file
          @lines.last[file] = @lines.last[file] << item.split(' ')[1].to_i
        else
          @lines << {"#{file}" => [item.split(' ')[1].to_i]}
        end
      end
    end

    def format_params
      @format_params ||= begin
        if diagnosis_method == 'get'
          {}
        else
          json_parse(diagnosis_params[:params])
        end.merge(lecter_analysis_parameter)
      rescue JSON::ParserError
        flash[:error] = 'Wrong parameters'
        return render :new
      end
    end

    def lecter_analysis_parameter
      { lecter_analysis: true }
    end

    def json_parse(string)
      string = '{' + string + '}' unless string.match(/\A{.*}\z/)
      string.gsub!('=>', ':')&.gsub!(/(“|”)/, '"')
      JSON.parse(string)
    end

    def diagnosis_method
      diagnosis_params[:method].downcase
    end
  end
end
