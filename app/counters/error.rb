# frozen_string_literal: true

module Parser
  module Counter
    class Error < Base
      def self.count(invalid_lines)
        base_count(invalid_lines)
      end
    end
  end
end
