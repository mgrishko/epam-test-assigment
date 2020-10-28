# frozen_string_literal: true

RSpec.describe Parser::Loader do
  subject { described_class.build(parsed_file) }

  let(:parsed_file) { File.join(Dir.pwd, 'spec', 'fixtures', 'webserver_broken_data.log') }

  describe '#new' do
    it 'creates instance of Parser::Loader class' do
      expect(subject).to be_kind_of described_class
    end
  end

  describe '#call' do
    context 'when data is correct' do
      it 'returns array of Parser::Models::LogRec instances' do
        expect(subject.call).to all be_kind_of Parser::Models::LogRec
      end
    end
  end
end
