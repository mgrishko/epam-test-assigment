# frozen_string_literal: true

RSpec.describe Parser::Counter::Uniq do
  let(:data) do
    [
      Parser::Models::LogRec.new(path: '/example', ip: '111.111.111.111'),
      Parser::Models::LogRec.new(path: '/example', ip: '111.111.111.111'),
      Parser::Models::LogRec.new(path: '/example', ip: '222.222.222.222'),
      Parser::Models::LogRec.new(path: '/second_example', ip: '222.222.222.222')
    ]
  end

  describe '#count_uniq' do
    let(:expected_result) { { '/example' => 2, '/second_example' => 1 } }

    it do
      expect(described_class).to respond_to(:count_uniq)
    end

    it 'returns a hash' do
      expect(described_class.count_uniq(data)).to be_kind_of(Hash)
    end

    it 'returns sorted data' do
      expect(described_class.count_uniq(data)).to eql(expected_result)
    end
  end
end
