# frozen_string_literal: true

module Parser
  class Loader
    def self.build(file)
      new(file, Parser::Models::LogRec, Parser::Validators::LogLine)
    end

    def initialize(file, log_rec, validator)
      @file = file
      @log_rec = log_rec
      @validator = validator
    end

    def call
      IO.foreach(file).map do |line|
        path, ip = line.split

        validate_content(path, ip)

        log_rec.new(path: path, ip: ip)
      end
    end

    private

    attr_reader :file, :log_rec, :validator

    def validate_content(path, ip)
      validator.new(path, ip).valid?
    end
  end
end
