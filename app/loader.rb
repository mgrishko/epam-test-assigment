# frozen_string_literal: true

module Parser
  class Loader
    def initialize(file)
      @file = file
      @log_rec = Parser::Models::LogRec
    end

    def call
      IO.foreach(file).map do |line|
        path, ip = line.split

        Parser::Validators::LogLine.new(path, ip).valid?

        log_rec.new(path: path, ip: ip)
      end
    end

    private

    attr_reader :file, :log_rec
  end
end
