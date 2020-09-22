# frozen_string_literal: true

RSpec.describe Parser::Runner do
  subject { described_class.new(file) }

  let(:file) { File.join(Dir.pwd, 'spec', 'fixtures', 'webserver.log') }

  let(:expected_output) do
    <<~HEREDOC
      /help_page/1 6 visits
      /index 4 visits
      /about/2 4 visits
      /home 4 visits
      /contact 4 visits
      /about 2 visits

      /help_page/1 5 unique views
      /index 4 unique views
      /home 4 unique views
      /about/2 3 unique views
      /contact 3 unique views
      /about 2 unique views
    HEREDOC
  end

  it 'return expected output' do
    expect { subject.call }.to output(expected_output).to_stdout
  end
end
