# frozen_string_literal: true

module Parser
  module Counter
    class Uniq < Base
      def self.count(log_data)
        uniq_records = log_data.uniq { |log_rec| [log_rec.path, log_rec.ip] }
        base_count(uniq_records)
      end
    end
  end
end
