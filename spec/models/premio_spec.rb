require 'rails_helper'

RSpec.describe Premio, type: :model do
  it { is_expected.to have_constant :ESTADOS }
  it { is_expected.to have_constant :NO_DISPONIBLE }
  it { is_expected.to have_constant :DISPONIBLE }
  it { is_expected.to have_constant :SORTEANDO }
  it { is_expected.to have_constant :SORTEADO }

  it { is_expected.to belong_to :tipo_premio }
  it { is_expected.to have_many :sorteos }

  it { is_expected.to validate_presence_of :codigo }
  it { is_expected.to validate_uniqueness_of :codigo }
  it { is_expected.to validate_presence_of :nombre }
  it { is_expected.to validate_uniqueness_of :nombre }
  it { is_expected.to validate_presence_of :tipo_premio_id }
  it { is_expected.to validate_presence_of :fecha_hora_sorteo }
  it { is_expected.to validate_presence_of :numero_participaciones }
  it { is_expected.to validate_presence_of :estado }

  context 'numero_participaciones' do
      subject = described_class.new

      it 'is expect to be incorrect if is < 0' do
        subject.numero_participaciones = -1

        subject.valid?

        expect(subject.errors[:numero_participaciones]).to include "must be greater than 0"
      end

      it 'is expect to be incorrect if is = 0' do
        subject.numero_participaciones = 0

        subject.valid?

        expect(subject.errors[:numero_participaciones]).to include "must be greater than 0"
      end

      it 'is expect to be correct if is > 0' do
        subject.numero_participaciones = 1

        subject.valid?

        expect(subject.errors[:numero_participaciones]).to be_blank
      end
    end

    context 'change estado' do

      it 'is expect to be no disponible after be created' do
        subject = described_class.create()

        expect(subject.no_disponible?).to be true
        expect(subject.estado).to be 0
      end

      Premio::ESTADOS.each do |estado_nombre, estado|
        subject = described_class.create()
        it "is expect to be #{estado_nombre} if his estado is changed to #{estado}" do

          subject.send("premio_#{estado_nombre}")

          expect(subject.send("#{estado_nombre}?")).to be true

        end
      end
    end
  end

# == Schema Information
#
# Table name: premios
#
#  id                     :integer          not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  codigo                 :string
#  nombre                 :string
#  tipo_premio_id         :integer
#  fecha_hora_sorteo      :datetime
#  numero_participaciones :integer
#  estado                 :integer          default(0)
#
