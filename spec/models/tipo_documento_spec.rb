require 'rails_helper'

RSpec.describe TipoDocumento, type: :model do
  it { is_expected.to validate_presence_of :codigo }
  it { is_expected.to validate_uniqueness_of :codigo }
  it { is_expected.to validate_presence_of :nombre }
  it { is_expected.to validate_uniqueness_of :nombre }
  it 'validates type field equal to TipoDocumento' do
    subject = described_class.new()
    expect(subject.type).to eq("TipoDocumento")
  end
end