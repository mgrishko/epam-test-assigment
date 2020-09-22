# frozen_string_literal: true

module Parser
  module Errors
    class FileExtensionError < StandardError
      def initialize(error_message = 'Please, use the required file extension!')
        super
      end
    end
  end
end
