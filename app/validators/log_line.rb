# frozen_string_literal: true

module Parser
  module Validators
    class LogLine
      PATH_REGEX = %r{^/\S*$}.freeze
      IP_REGEX = /^\d+\.\d+\.\d+\.\d+$/.freeze

      def initialize(path, ip, error_model = Parser::ErrorModels::LogRecError)
        @path = path
        @ip = ip
        @error_model = error_model
        @errors = []
      end

      def validate
        validate_path
        validate_ip
        errors
      end

      private

      attr_reader :path, :ip, :error_model
      attr_accessor :errors

      def validate_path
        errors << error_model.new(message: 'path - incorrect') unless PATH_REGEX.match?(path)
      end

      def validate_ip
        errors << error_model.new(message: 'ip - incorrect') unless IP_REGEX.match?(ip)
      end
    end
  end
end
