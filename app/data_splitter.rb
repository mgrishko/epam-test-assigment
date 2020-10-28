# frozen_string_literal: true

module Parser
  class DataSplitter
    def initialize(load_data)
      @load_data = load_data
    end

    def call
      load_data.partition { |line| line.errors.empty? }
    end

    private

    attr_reader :load_data
  end
end
