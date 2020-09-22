# frozen_string_literal: true

module Parser
  class Counter
    def initialize(log_records)
      @log_records = log_records
    end

    def count_all
      group(@log_records)
    end

    def count_uniq
      uniq_rec = @log_records.uniq { |log_rec| [log_rec.path, log_rec.ip] }
      group(uniq_rec)
    end

    private

    def group(log_records)
      log_records.group_by(&:path)
                 .transform_values(&:count)
                 .sort_by(&:last)
                 .reverse
                 .to_h
    end
  end
end
