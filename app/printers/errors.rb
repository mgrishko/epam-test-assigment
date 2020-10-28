# frozen_string_literal: true

module Parser
  module Printers
    class Errors < Base
      def self.print(invalid_lines)
        invalid_lines.map do |invalid_line|
          puts "path: #{invalid_line.path} with ip: #{invalid_line.ip} has errors: #{
            print_error_messages(invalid_line.errors)}"
        end
      end

      def self.print_error_messages(errors)
        errors.map(&:message).join('; ')
      end
      private_class_method :print_error_messages
    end
  end
end
