# frozen_string_literal: true

RSpec.describe Parser::Validators::LogLine do
  subject { described_class.new(path, ip).validate }

  describe '#validate!' do
    context 'when path is invalid' do
      let(:path) { 'example' }
      let(:ip) { '111.111.111.111' }

      it 'raise error' do
        expect(subject).to contain_exactly(have_attributes(message: 'path - incorrect'))
      end
    end

    context 'when ip is incorrect' do
      let(:path) { '/example' }
      let(:ip) { 'xxx.111.xxx.111' }

      it 'raise error' do
        expect(subject).to contain_exactly(have_attributes(message: 'ip - incorrect'))
      end
    end

    context 'when path and ip are incorrect' do
      let(:path) { 'example' }
      let(:ip) { 'xxx.111.xxx.111' }

      it 'raise error' do
        expect(subject).to contain_exactly(have_attributes(message: 'path - incorrect'),
                                           have_attributes(message: 'ip - incorrect'))
      end
    end

    context 'when file is valid' do
      let(:path) { '/example' }
      let(:ip) { '111.111.111.111' }

      it 'doesnt raise an error' do
        expect(subject).to eql([])
      end
    end
  end
end
