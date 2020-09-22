# frozen_string_literal: true

module Parser
  module Counter
    class Uniq < Base
      def self.count_uniq(log_data)
        uniq_records = log_data.uniq { |log_rec| [log_rec.path, log_rec.ip] }
        count(uniq_records)
      end
    end
  end
end
