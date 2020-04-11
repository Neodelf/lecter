# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lecter::HtmlGenerator, type: :service do
  let(:data) do
    [{ 'spec/fixtures/source.rb' => [3] }]
  end

  subject { described_class.new(data).call }

  it 'returns array of Lecter::FileListing objects' do
    all_elements_has_specific_class = subject.inject(true) do |memo, object|
      memo && object.is_a?(Lecter::FileListing)
    end

    expect(all_elements_has_specific_class).to be_truthy
  end

  it 'returns file_path object params' do
    expect(subject.first.file_path)
      .to eq('spec/fixtures/source.rb')
  end

  it 'returns value object params' do
    expect(subject.first.html_rows).to eq(
      [
        "<div style=''><code>1 # frozen_string_literal: true \n</code></div>",
        "<div style=''><code>2  \n</code></div>",
        "<div style='background-color: #4a4a4a;'><code>3 some ruby code -> 1\n</code></div>"
      ]
    )
  end
end
