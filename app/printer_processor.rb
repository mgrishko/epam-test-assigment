# frozen_string_literal: true

module Parser
  class PrinterProcessor
    def self.run(results, printer = Parser::Printers::Statistics)
      printer.print(results)
    end
  end
end
