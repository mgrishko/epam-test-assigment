# frozen_string_literal: true

RSpec.describe Parser::Validators::LogLine do
  subject { described_class.new(path, ip).valid? }

  describe '#valid?' do
    context 'when path is invalid' do
      let(:path) { 'example' }
      let(:ip) { '111.111.111.111' }

      it 'raise error' do
        expect { subject }.to raise_error(Parser::Errors::PathError).with_message(/Path incorrect!/)
      end
    end

    context 'when ip is incorrect' do
      let(:path) { '/example' }
      let(:ip) { 'xxx.111.xxx.111' }

      it 'raise error' do
        expect { subject }.to raise_error(Parser::Errors::IpError).with_message(/Ip incorrect!/)
      end
    end

    context 'when file is valid' do
      let(:path) { '/example' }
      let(:ip) { '111.111.111.111' }

      it 'doesnt raise an error' do
        expect { subject }.not_to raise_error
      end
    end
  end
end
