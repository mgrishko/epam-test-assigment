# frozen_string_literal: true

RSpec.describe Parser::Processor do
  let(:data) do
    [
      Parser::Models::LogRec.new(path: '/example', ip: '111.111.111.111'),
      Parser::Models::LogRec.new(path: '/example', ip: '111.111.111.111'),
      Parser::Models::LogRec.new(path: '/example', ip: '222.222.222.222'),
      Parser::Models::LogRec.new(path: '/second_example', ip: '222.222.222.222')
    ]
  end

  describe '.run' do
    context 'for main counter' do
      let(:counter) { Parser::Counter::Main }
      let(:expected_result) { { '/example' => 3, '/second_example' => 1 } }

      it do
        expect(described_class).to respond_to(:run)
      end

      it 'returns a hash' do
        expect(described_class.run(data, counter)).to be_kind_of(Hash)
      end

      it 'returns sorted data' do
        expect(described_class.run(data, counter)).to eql(expected_result)
      end
    end

    context 'for uniq counter' do
      let(:counter) { Parser::Counter::Uniq }
      let(:expected_result) { { '/example' => 2, '/second_example' => 1 } }

      it do
        expect(described_class).to respond_to(:run)
      end

      it 'returns a hash' do
        expect(described_class.run(data, counter)).to be_kind_of(Hash)
      end

      it 'returns sorted data' do
        expect(described_class.run(data, counter)).to eql(expected_result)
      end
    end
  end
end
