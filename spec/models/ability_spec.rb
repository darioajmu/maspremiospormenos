require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability, type: :model do
  usuario = FactoryGirl.build(:usuario)
  subject { described_class.new(usuario) }

  context 'an admin' do
    usuario.role_id = Usuario::ADMIN

    it { is_expected.to be_able_to(:manage, :all) }
  end

  context 'an user' do

    it { is_expected.to be_able_to(:read, GanadoresSorteo) }
    it { is_expected.to be_able_to(:solicitar, Participacion) }
    it { is_expected.to be_able_to(:read, :completos, Premio) }
    it { is_expected.to be_able_to(:assign_participation, Sorteo) }
    it { is_expected.to be_able_to(:edit, :show, Usuario, id: usuario.id) }
  end
end
