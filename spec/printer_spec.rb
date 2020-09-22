# frozen_string_literal: true

RSpec.describe Parser::Printer do
  subject { described_class.new(visit_results, unique_results) }

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
  let(:expected_result) do
    <<~HEREDOC
      /about/2 90 visits
      /contact 89 visits
      /index 82 visits
      /about 81 visits
      /help_page/1 80 visits
      /home 78 visits

      /index 23 unique views
      /home 23 unique views
      /contact 23 unique views
      /help_page/1 23 unique views
      /about/2 22 unique views
      /about 21 unique views
    HEREDOC
  end

  describe '#new' do
    it 'creates instance of Parser::Printer class' do
      expect(subject).to be_kind_of(described_class)
    end
  end

  context 'when prints views' do
    it 'prints parsed log data' do
      expect { subject.call }.to output(expected_result).to_stdout
    end
  end
end
