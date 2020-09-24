# frozen_string_literal: true

module Parser
  module Counter
    class Base
      def self.count(log_data)
        raise NotImplementedError
      end

      def self.base_count(log_data)
        log_data.group_by(&:path)
                .transform_values(&:count)
                .sort_by(&:last)
                .reverse
                .to_h
      end
    end
  end
end
