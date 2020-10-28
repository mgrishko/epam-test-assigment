# frozen_string_literal: true

require_relative 'loader'
require_relative 'errors/file_error'
require_relative 'errors/file_extension_error'
require_relative 'error_models/log_rec_error'
require_relative 'validators/file'
require_relative 'validators/log_line'
require_relative 'models/log_rec'
require_relative 'processor'
require_relative 'data_splitter'
require_relative 'counters/base'
require_relative 'counters/total'
require_relative 'counters/uniq'
require_relative 'counters/error'
require_relative 'printer_processor'
require_relative 'printers/base'
require_relative 'printers/statistics'
require_relative 'printers/errors'

module Parser
  class Runner
    COUNTERS = [Parser::Counter::Total, Parser::Counter::Uniq].freeze
    ERROR_COUNTERS = [Parser::Counter::Error].freeze
    PRINTERS = [Parser::Printers::Statistics, Parser::Printers::Errors].freeze
    STATISTIC_PARTS = %i[visits unique_views errors].freeze

    def initialize(file)
      @file = file
    end

    def call
      validate_file

      load_data
      valid_lines, invalid_lines = split_data

      visit_results, unique_results = count(valid_lines, COUNTERS)
      error_results, _ = count(invalid_lines, ERROR_COUNTERS)

      print_output(merge_arrays(visit_results, unique_results, error_results), Parser::Printers::Statistics)
      print_output(invalid_lines, Parser::Printers::Errors)
    end

    private

    def merge_arrays(*statistics_data)
      Hash[STATISTIC_PARTS.zip(statistics_data)]
    end

    def print_output(results, printer)
      Parser::PrinterProcessor.run(results, printer)
    end

    def validate_file
      Parser::Validators::File.new(file).validate!
    end

    def load_data
      @load_data ||= Parser::Loader.build(file).call
    end

    def split_data
      DataSplitter.new(load_data).call
    end

    def count(valid_lines, counters = [])
      counters.map { |counter| Parser::Processor.run(valid_lines, counter) }
    end

    attr_reader :file
  end
end
