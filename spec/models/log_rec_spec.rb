# frozen_string_literal: true

RSpec.describe Parser::Models::LogRec do
  subject { described_class.new(path: '/example', ip: '111.111.111.111', errors: {}) }

  it 'creates an instance of Parser::Models::LogRec and have instaled attributes' do
    aggregate_failures 'response answer' do
      expect(subject).to be_kind_of(described_class)
      expect(subject).to have_attributes(path: '/example', ip: '111.111.111.111', errors: {})
    end
  end
end
