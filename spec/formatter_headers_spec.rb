# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lecter::FormatterHeaders, type: :service do
  let(:headers) { 'content_type=text/html,accept=*/*' }

  subject { described_class.new(headers).call }

  it 'returns a hash' do
    is_expected.to eq({ 'content_type' => 'text/html', 'accept' => '*/*' })
  end

  context 'if headers is empty string' do
    let(:headers) { '' }

    it 'returns an empty hash' do
      is_expected.to eq({})
    end
  end
end
