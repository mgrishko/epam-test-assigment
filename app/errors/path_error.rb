# frozen_string_literal: true

module Parser
  module Errors
    class PathError < StandardError
      def initialize(error_message = 'Path incorrect!')
        super
      end
    end
  end
end
