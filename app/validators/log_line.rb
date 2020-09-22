# frozen_string_literal: true

module Parser
  module Validators
    class LogLine
      PATH_REGEX = %r{^/\S*$}.freeze
      IP_REGEX = /^\d+\.\d+\.\d+\.\d+$/.freeze

      def initialize(path, ip)
        @path = path
        @ip = ip
      end

      def valid?
        raise Parser::Errors::PathError unless PATH_REGEX.match?(path)
        raise Parser::Errors::IpError unless IP_REGEX.match?(ip)
      end

      private

      attr_reader :path, :ip
    end
  end
end
