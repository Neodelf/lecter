# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lecter::HtmlRow, type: :service do
  let(:row) { 'some code in ruby' }
  let(:row_number) { 1 }
  let(:row_executable) { true }
  let(:order_of_executed_lines) { [1] }

  subject { described_class.new(row, row_number, row_executable, order_of_executed_lines).create }

  context 'if row is executable' do
    it 'adds executable order to the end of row' do
      is_expected.to end_with(
        "<div style='background-color: #{described_class::BACKGROUND_INCLUDED_ROW};'><code>1 some \
code in ruby -> 1\n</code></div>"
      )
    end

    context 'if row is executed two times' do
      let(:order_of_executed_lines) { [1, 1] }

      it 'adds executable order to the end of row' do
        is_expected.to end_with("-> 1, 2\n</code></div>")
      end
    end

    context 'if executing row is not consistently' do
      let(:order_of_executed_lines) { [1, 2, 1] }

      it 'adds executable order to the end of row' do
        is_expected.to end_with("-> 1, 3\n</code></div>")
      end
    end

    context 'if executing row is last in order' do
      let(:order_of_executed_lines) { [2, 1] }

      it 'adds executable order to the end of row' do
        is_expected.to end_with("-> 2\n</code></div>")
      end
    end
  end

  context 'if row is not executable' do
    let(:row_executable) { false }

    it 'adds background color' do
      is_expected.not_to include("background-color: #{described_class::BACKGROUND_INCLUDED_ROW}")
    end

    it 'adds arrow' do
      is_expected.not_to include(described_class::ARROW)
    end
  end
end
