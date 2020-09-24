# frozen_string_literal: true

module Parser
  class Printer
    def initialize(visit_results, unique_results)
      @visit_results = visit_results
      @unique_results = unique_results
    end

    def call
      visit_results.each do |path, times|
        puts "#{path} #{times} visits"
      end
      puts ''
      unique_results.each do |path, times|
        puts "#{path} #{times} unique views"
      end
    end

    private

    attr_reader :visit_results, :unique_results
  end
end
