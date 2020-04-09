# frozen_string_literal: true

require 'lecter/html_row'

module Lecter
  class HtmlGenerator
    COUNT_LINES_AROUND_RUNNING_ROW = 5
    ELLIPSIS = '...'
    NEW_LINE = "\n"

    def initialize(data)
      @data = data
    end

    def call
      @data.each_with_index.map do |item, _item_index|
        @file_name = item.keys.first

        @executable_row_numbers = item.values.split(' ').flatten.map(&:to_i)
        previous_row_is_empty = false

        html_rows = file_context.each_with_index.map do |file_row, file_row_index|
          @file_row_index = file_row_index
          row_executable = executable_row_numbers.include?(file_row_index + 1)

          if row_executable || file_row_in_showing_range?(file_row_index)
            previous_row_is_empty = false
            Lecter::HtmlRow.new(
              file_row,
              file_row_index + 1,
              row_executable,
              executable_row_numbers
            ).create
          elsif !previous_row_is_empty
            previous_row_is_empty = true
            ELLIPSIS + NEW_LINE
          end
        end

        FileListing.new(file_name, html_rows)
      end
    end

    private

    attr_accessor :executable_row_numbers, :file_row_index, :file_name

    def file_row_in_showing_range?(_index)
      executable_row_numbers.reduce(false) do |memo, row_number|
        memo || file_row_index.in?(
          row_number - COUNT_LINES_AROUND_RUNNING_ROW - 1..
            row_number + COUNT_LINES_AROUND_RUNNING_ROW - 1
        )
      end
    end

    def file_context
      File.open(Rails.root.join(file_name), 'r').read.split(NEW_LINE)
    end
  end

  FileListing = Struct.new(:file_name, :html_rows)
end
