require 'rails_helper'

RSpec.describe TipoPremio, type: :model do
  it { is_expected.to validate_presence_of :codigo }
  it { is_expected.to validate_uniqueness_of(:codigo).scoped_to(:type) }
  it { is_expected.to validate_presence_of :nombre }
  it { is_expected.to validate_uniqueness_of(:nombre).scoped_to(:type) }

  it 'validates type field equal to TipoPremio' do
    subject = described_class.new()
    expect(subject.type).to eq("TipoPremio")
  end

it { is_expected.to have_many :premios }
end

# == Schema Information
#
# Table name: simple_objects
#
#  id         :integer          not null, primary key
#  type       :string
#  codigo     :string
#  nombre     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
