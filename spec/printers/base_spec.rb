# frozen_string_literal: true

RSpec.describe Parser::Printers::Base do
  subject { described_class }

  describe '.print' do
    it do
      expect(described_class).to respond_to(:print)
    end

    it 'raise NotImplementedError' do
      expect { described_class.print }.to raise_error(NotImplementedError)
    end
  end
end
