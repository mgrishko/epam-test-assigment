# frozen_string_literal: true

RSpec.describe Parser::Loader do
  subject { described_class.new(parsed_file) }

  let(:parsed_file) { File.join(Dir.pwd, 'spec', 'fixtures', 'webserver.log') }

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

    context 'when data is broken' do
      let(:parsed_file) { File.join(Dir.pwd, 'spec', 'fixtures', 'webserver_broken_data.log') }

      it 'returns array of Parser::Models::LogRec instances' do
        expect { subject.call }.to raise_error(Parser::Errors::PathError)
      end
    end
  end
end
