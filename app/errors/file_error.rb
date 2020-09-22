# frozen_string_literal: true

module Parser
  module Errors
    class FileError < StandardError
      def initialize(error_message = 'File not found!')
        super
      end
    end
  end
end
