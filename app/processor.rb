# frozen_string_literal: true

module Parser
  class Processor
    def self.run(log_data, counter)
      counter.count(log_data)
    end
  end
end
