# frozen_string_literal: true

RSpec.describe Parser::DataSplitter do
  subject(:subject) { described_class.new(data).call }

  let(:valid_log_rec) { Parser::Models::LogRec.new path: '/example', ip: '111.111.111.111', errors: '' }
  let(:invalid_log_rec_1) do
    Parser::Models::LogRec.new path: 'failure_path', ip: '222.222.222.222',
                               errors: 'path - incorrect'
  end
  let(:invalid_log_rec_2) do
    Parser::Models::LogRec.new path: '/failure_path', ip: 'localhost',
                               errors: 'ip - incorrect'
  end

  let(:data) do
    [valid_log_rec, invalid_log_rec_1, invalid_log_rec_2]
  end

  describe '#call' do
    it 'splits on two arrays' do
      expect(subject).to eql([[valid_log_rec], [invalid_log_rec_1, invalid_log_rec_2]])
    end
  end
end
