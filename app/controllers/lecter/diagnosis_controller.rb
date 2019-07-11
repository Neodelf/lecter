require 'rest-client'

class Lecter::DiagnosisController < ActionController::Base
  def new
  end

  def show
  end

  def create
    if diagnosis_params[:method].downcase == 'get'
      response = ::RestClient.get(
        'localhost:3000/' + diagnosis_params[:endpoint],
        params: (YAML.load(diagnosis_params[:params]) || {}).merge(lecter_analysis: true)
      ).body
      prepare_data(response)
    elsif diagnosis_params[:method].downcase == 'post'
      response = ::RestClient.post(
        'localhost:3000/' + diagnosis_params[:endpoint],
        YAML.load(diagnosis_params[:params]).merge(lecter_analysis: true)
      ).body
      prepare_data(response)
    end

    render :show
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
end
