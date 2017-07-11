require 'rails_helper'

RSpec.describe GanadoresSorteo, type: :model do
  it { is_expected.to belong_to :sorteo }
  it { is_expected.to delegate_method(:premio).to :sorteo }
  it { is_expected.to delegate_method(:participacion).to :sorteo }
  it { is_expected.to delegate_method(:usuario).to :participacion }

  it { is_expected.to validate_presence_of :sorteo_id }


  context 'check_sorteo_prize' do

    it 'is expected to be correct if the prize was never assigned' do
      premio1 = FactoryGirl.create(:premio)
      premio2 = FactoryGirl.create(:premio)

      sorteo1 = Sorteo.create(premio_id: premio1.id, participacion_id: 1)
      sorteo2 = Sorteo.create(premio_id: premio2.id, participacion_id: 2)

      ganador = described_class.create(sorteo_id: sorteo1.id)
      new_ganador = described_class.new(sorteo_id: sorteo2.id)

      new_ganador.valid?

      expect(new_ganador.errors).to be_empty
    end

    it 'is expected to be incorrect if the prize was assigned' do
      premio1 = FactoryGirl.create(:premio)
      premio2 = FactoryGirl.create(:premio)

      sorteo1 = Sorteo.create(premio_id: premio1.id, participacion_id: 1)
      sorteo2 = Sorteo.create(premio_id: premio1.id, participacion_id: 2)

      ganador = described_class.create(sorteo_id: sorteo1.id)
      new_ganador = described_class.new(sorteo_id: sorteo2.id)

      new_ganador.valid?

      expect(new_ganador.errors[:premio_id]).to include "ya ha tenido un ganador"
    end
  end

end

# == Schema Information
#
# Table name: ganadores_sorteos
#
#  id         :integer          not null, primary key
#  sorteo_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
