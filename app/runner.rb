# frozen_string_literal: true

require_relative 'loader'
require_relative 'errors/file_error'
require_relative 'errors/file_extension_error'
require_relative 'errors/ip_error'
require_relative 'errors/path_error'
require_relative 'validators/file'
require_relative 'validators/log_line'
require_relative 'models/log_rec'

module Parser
  class Runner
    def initialize(file)
      @file = file
    end

    def call
      Parser::Validators::File.new(file).valid?

      Parser::Loader.new(file).call
      # count
      # sort
      # print
    end

    private

    attr_reader :file
  end
end
