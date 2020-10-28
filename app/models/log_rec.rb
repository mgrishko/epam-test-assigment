# frozen_string_literal: true

module Parser
  module Models
    class LogRec
      attr_reader :path, :ip, :errors

      def initialize(path:, ip:, errors: [])
        @path = path
        @ip = ip
        @errors = errors
      end
    end
  end
end
