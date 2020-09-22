# frozen_string_literal: true

RSpec.describe Parser::Counter::Base do
  let(:data) do
    [
      Parser::Models::LogRec.new(path: '/example', ip: '111.111.111.111'),
      Parser::Models::LogRec.new(path: '/example', ip: '111.111.111.111'),
      Parser::Models::LogRec.new(path: '/example', ip: '222.222.222.222'),
      Parser::Models::LogRec.new(path: '/second_example', ip: '222.222.222.222')
    ]
  end

  describe '#count' do
    let(:expected_result) { { '/example' => 3, '/second_example' => 1 } }

    it do
      expect(described_class).to respond_to(:count)
    end

    it 'returns a hash' do
      expect(described_class.count(data)).to be_kind_of(Hash)
    end

    it 'returns sorted data' do
      expect(described_class.count(data)).to eql(expected_result)
    end
  end
end
