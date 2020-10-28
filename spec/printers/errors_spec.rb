# frozen_string_literal: true

RSpec.describe Parser::Printers::Errors do
  subject { described_class.print(invalid_lines) }

  let(:invalid_lines) { [Parser::Models::LogRec.new(path: 'failure_page', ip: 'localhost', errors: error_objects)] }
  let(:error_objects) do
    [
      Parser::ErrorModels::LogRecError.new(message: 'path - incorrect'),
      Parser::ErrorModels::LogRecError.new(message: 'ip - incorrect')
    ]
  end
  let(:expected_result) do
    <<~HEREDOC
      path: failure_page with ip: localhost has errors: path - incorrect; ip - incorrect
    HEREDOC
  end

  context 'when prints views' do
    it 'prints parsed log data' do
      expect { subject }.to output(expected_result).to_stdout
    end
  end
end
