# frozen_string_literal: true

RSpec.describe Parser::Counter do
  subject { described_class.new(data) }

  let(:data) do
    [
      Parser::Models::LogRec.new(path: '/example', ip: '111.111.111.111'),
      Parser::Models::LogRec.new(path: '/example', ip: '111.111.111.111'),
      Parser::Models::LogRec.new(path: '/example', ip: '222.222.222.222'),
      Parser::Models::LogRec.new(path: '/second_example', ip: '222.222.222.222')
    ]
  end

  describe '#new' do
    it 'creates instance of Parser::Counter class' do
      expect(subject).to be_kind_of(described_class)
    end
  end

  context 'when counting all views' do
    let(:expected_result) { { '/example' => 3, '/second_example' => 1 } }

    it do
      expect(subject).to respond_to(:count_all)
    end

    it 'returns a hash' do
      expect(subject.count_all).to be_kind_of(Hash)
    end

    it 'returns sorted data' do
      expect(subject.count_all).to eql(expected_result)
    end
  end

  context 'when counting unique views' do
    let(:expected_result) { { '/example' => 2, '/second_example' => 1 } }

    it do
      expect(subject).to respond_to(:count_uniq)
    end

    it 'returns a hash' do
      expect(subject.count_uniq).to be_kind_of(Hash)
    end

    it 'returns sorted data' do
      expect(subject.count_uniq).to eql(expected_result)
    end
  end
end
