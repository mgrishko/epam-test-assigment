# frozen_string_literal: true

module Parser
  module ErrorModels
    class LogRecError
      attr_accessor :message

      def initialize(message: '')
        @message = message
      end
    end
  end
end
