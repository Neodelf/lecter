# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lecter::FormatterPayload, type: :service do
  let(:payload) { '"post"=>{"title"=>"New title", "description"=>"Desciption"}' }

  subject { described_class.new(payload).call }

  it 'returns hash' do
    is_expected.to eq(
      {
        lecter_enabled: true,
        'post' => { 'description' => 'Desciption', 'title' => 'New title' }
      }
    )
  end

  context 'if payload is empty string' do
    let(:payload) { '' }

    it 'returns hash' do
      is_expected.to eq({ lecter_enabled: true })
    end
  end
end
