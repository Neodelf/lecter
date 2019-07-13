require 'rest-client'
require 'slim-rails'

class Lecter::DiagnosisController < ActionController::Base
  before_action :format_params, only: :create

  def new
  end

  def show
  end

  def create
    response =
      case diagnosis_params[:method]
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

  def prepare_data(items)
    @lines = []
    @items = items.split(';')
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
      return {} unless diagnosis_params[:params].present?

      json_parse(diagnosis_params[:params]).merge(lecter_analysis_parameter)
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
    string.gsub!('=>', ':').gsub!(/(“|”)/, '"')
    JSON.parse(string)
  end
end
