# frozen_string_literal: true

RSpec.describe Parser::ErrorModels::LogRecError do
  subject { described_class.new(message: 'ip-invalid') }

  it 'creates an instance of Parser::ErrorModels::LogRecError and have instaled attributes' do
    aggregate_failures 'response answer' do
      expect(subject).to be_kind_of(described_class)
      expect(subject).to have_attributes(message: 'ip-invalid')
    end
  end
end
