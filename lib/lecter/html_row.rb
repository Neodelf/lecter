# frozen_string_literal: true

module Lecter
  class HtmlRow
    ARROW = '-> '
    BACKGROUND_INCLUDED_ROW = '#4a4a4a'
    NEW_LINE_SYMBOL = "\n"

    def initialize(row, row_number, row_executable, order_of_executed_lines)
      @row = row
      @row_number = row_number
      @row_executable = row_executable
      @order_of_executed_lines = order_of_executed_lines
    end

    def create
      "<div style='#{style}'><code>#{html_row}</code></div>"
    end

    private

    attr_reader :row, :row_number, :row_executable, :order_of_executed_lines

    def html_row
      [row_number, row, row_calling_order_number].join(' ') + NEW_LINE_SYMBOL
    end

    def row_calling_order_number
      return unless row_executable

      ARROW + order_of_executed_lines
              .each_with_index
              .select { |_, index| order_of_executed_lines[index] == row_number }
              .map { |_, index| index + 1 }
              .join(', ')
    end

    def style
      row_executable ? "background-color: #{BACKGROUND_INCLUDED_ROW};" : nil
    end
  end
end
