# frozen_string_literal: true

module Parser
  module Counter
    class Total < Base
      def self.count(log_data)
        base_count(log_data)
      end
    end
  end
end
