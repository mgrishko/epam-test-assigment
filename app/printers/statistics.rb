# frozen_string_literal: true

module Parser
  module Printers
    class Statistics < Base
      def self.print(results)
        results.each do |type, data|
          data.each do |path, times|
            puts "#{path} #{times} #{type}"
          end
          puts ''
        end
      end
    end
  end
end
