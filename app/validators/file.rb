# frozen_string_literal: true

module Parser
  module Validators
    class File
      REQUIRED_FORMATS = %w[.log].freeze

      def initialize(file)
        @file = file
      end

      def valid?
        raise Parser::Errors::FileError unless ::File.exist?(file)
        raise Parser::Errors::FileExtensionError unless REQUIRED_FORMATS.include? ::File.extname(file)
      end

      private

      attr_reader :file
    end
  end
end
