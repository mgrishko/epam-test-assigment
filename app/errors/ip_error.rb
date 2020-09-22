# frozen_string_literal: true

module Parser
  module Errors
    class IpError < StandardError
      def initialize(error_message = 'Ip incorrect!')
        super
      end
    end
  end
end
