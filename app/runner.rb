# frozen_string_literal: true

require_relative 'loader'
require_relative 'errors/file_error'
require_relative 'errors/file_extension_error'
require_relative 'errors/ip_error'
require_relative 'errors/path_error'
require_relative 'validators/file'
require_relative 'validators/log_line'
require_relative 'models/log_rec'
require_relative 'counters/base'
require_relative 'counters/uniq'
require_relative 'printer'

module Parser
  class Runner
    def initialize(file)
      @file = file
    end

    def call
      validate_file

      log_data = load_data
      visit_results = count_visit_results(log_data)
      unique_results = count_unique_results(log_data)

      print_results(visit_results, unique_results)
    end

    private

    def validate_file
      Parser::Validators::File.new(file).valid?
    end

    def load_data
      Parser::Loader.build(file).call
    end

    def count_visit_results(log_data)
      Parser::Counter::Base.count(log_data)
    end

    def count_unique_results(log_data)
      Parser::Counter::Uniq.count_uniq(log_data)
    end

    def print_results(visit_results, unique_results)
      Parser::Printer.new(visit_results, unique_results).call
    end

    attr_reader :file
  end
end
