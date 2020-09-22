# frozen_string_literal: true

RSpec.describe Parser::Validators::File do
  subject { described_class.new(file).valid? }

  describe '#valid?' do
    context 'when file path is invalid' do
      let(:file) { '' }

      it 'raise error' do
        expect { subject }.to raise_error(Parser::Errors::FileError).with_message(/File not found!/)
      end
    end

    context 'when file extension os incorrect' do
      let(:file) { File.join(Dir.pwd, 'spec', 'fixtures', 'webserver.incorrect_log') }

      it 'raise error' do
        expect { subject }.to raise_error(Parser::Errors::FileExtensionError)
          .with_message(/Please, use the required file extension!/)
      end
    end

    context 'when file is valid' do
      let(:file) { File.join(Dir.pwd, 'spec', 'fixtures', 'webserver.log') }

      it 'doesnt raise an error' do
        expect { subject }.not_to raise_error
      end
    end
  end
end
