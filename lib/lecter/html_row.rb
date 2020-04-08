# frozen_string_literal: true

module Lecter
  class HtmlRow
    ARROW = '-> '
    BACKGROUND_INCLUDED_ROW = '#4a4a4a'
    NEW_LINE_SYMBOL = "\n"

    def initialize(file_row, file_row_index, file_includes_row, lines)
      @file_row = file_row
      @file_row_number = file_row_index
      @file_includes_row = file_includes_row
      @lines = lines
    end

    def create
      "<div style='#{style}'><code>#{html_row}</code></div>".html_safe
    end

    private

    attr_reader :file_row, :file_row_number, :file_includes_row, :lines

    def html_row
      [file_row_number, file_row, row_calling_order_number].join(' ') + NEW_LINE_SYMBOL
    end

    def row_calling_order_number
      if file_includes_row
        ARROW + lines
                .each_with_index
                .select { |_, index| lines[index] == file_row_number }
                .map { |_, index| index + 1 }
                .join(', ')
      end
    end

    def style
      file_includes_row ? "background-color: #{BACKGROUND_INCLUDED_ROW};" : nil
    end
  end
end
