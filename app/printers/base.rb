# frozen_string_literal: true

module Parser
  module Printers
    class Base
      def self.print
        raise NotImplementedError
      end
    end
  end
end
