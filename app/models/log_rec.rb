# frozen_string_literal: true

module Parser
  module Models
    class LogRec
      attr_reader :path, :ip

      def initialize(path:, ip:)
        @path = path
        @ip = ip
      end
    end
  end
end
