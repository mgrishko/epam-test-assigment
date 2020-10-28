# frozen_string_literal: true

RSpec.describe Parser::PrinterProcessor do
  describe '.run' do
    context 'for statistic printer' do
      let(:printer) { Parser::Printers::Statistics }
      let(:data) do
        {
          visits: { '/help_page/1' => 6, '/index' => 4, '/about/2' => 4, '/home' => 4, '/contact' => 4, '/about' => 2 },
          unique_views: { '/help_page/1' => 5, '/index' => 4, '/home' => 4, '/about/2' => 3, '/contact' => 3,
                          '/about' => 2 },
          errors: { 'failure_page' => 1 }
        }
      end

      let(:expected_output) do
        <<~HEREDOC
          /help_page/1 6 visits
          /index 4 visits
          /about/2 4 visits
          /home 4 visits
          /contact 4 visits
          /about 2 visits

          /help_page/1 5 unique_views
          /index 4 unique_views
          /home 4 unique_views
          /about/2 3 unique_views
          /contact 3 unique_views
          /about 2 unique_views

          failure_page 1 errors

        HEREDOC
      end

      it 'returns expected data' do
        expect { described_class.run(data, printer) }.to output(expected_output).to_stdout
      end
    end

    context 'for errors printer' do
      let(:printer) { Parser::Printers::Errors }
      let(:data) { [Parser::Models::LogRec.new(path: 'failure_page', ip: 'localhost', errors: error_objects)] }
      let(:error_objects) do
        [
          Parser::ErrorModels::LogRecError.new(message: 'path - incorrect'),
          Parser::ErrorModels::LogRecError.new(message: 'ip - incorrect')
        ]
      end

      let(:expected_output) do
        <<~HEREDOC
          path: failure_page with ip: localhost has errors: path - incorrect; ip - incorrect
        HEREDOC
      end

      it 'returns expected data' do
        expect { described_class.run(data, printer) }.to output(expected_output).to_stdout
      end
    end
  end
end
