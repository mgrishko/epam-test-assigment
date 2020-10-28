# frozen_string_literal: true

RSpec.describe Parser::Printers::Statistics do
  subject { described_class.print({ visits: visit_results, unique_views: unique_results, errors: error_results }) }

  let(:visit_results) do
    {
      '/about/2' => 90,
      '/contact' => 89,
      '/index' => 82,
      '/about' => 81,
      '/help_page/1' => 80,
      '/home' => 78
    }
  end
  let(:unique_results) do
    {
      '/index' => 23,
      '/home' => 23,
      '/contact' => 23,
      '/help_page/1' => 23,
      '/about/2' => 22,
      '/about' => 21
    }
  end
  let(:error_results) do
    {
      'failure_path' => 1
    }
  end
  let(:expected_result) do
    <<~HEREDOC
      /about/2 90 visits
      /contact 89 visits
      /index 82 visits
      /about 81 visits
      /help_page/1 80 visits
      /home 78 visits

      /index 23 unique_views
      /home 23 unique_views
      /contact 23 unique_views
      /help_page/1 23 unique_views
      /about/2 22 unique_views
      /about 21 unique_views

      failure_path 1 errors

    HEREDOC
  end

  context 'when prints views' do
    it 'prints parsed log data' do
      expect { subject }.to output(expected_result).to_stdout
    end
  end
end
