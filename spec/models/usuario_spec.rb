require 'rails_helper'

RSpec.describe Usuario, type: :model do
  it { is_expected.to have_constant :ADMIN }
  it { is_expected.to have_constant :USER }

  it { is_expected.to validate_uniqueness_of(:username).case_insensitive }
  it { is_expected.to validate_presence_of :tipo_documento_id }
  it { is_expected.to validate_presence_of :documento }
  it { is_expected.to validate_presence_of :nombre }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :apellido1 }
  it { is_expected.to validate_presence_of :apellido2 }
  it { is_expected.to validate_presence_of :provincia_id }
  it { is_expected.to validate_presence_of :ciudad }
  it { is_expected.to validate_presence_of :codigopostal }
  it { is_expected.to validate_presence_of :direccion }
  it { is_expected.to validate_presence_of :fechadenacimiento }
  it { is_expected.to validate_presence_of :movil }
  it { is_expected.to validate_presence_of :sexo }
  it { is_expected.to validate_presence_of :role_id }
  it { is_expected.to allow_value('user.example').for(:username) }

  it { is_expected.to belong_to :tipo_documento }
  it { is_expected.to have_many :participaciones }
  it { is_expected.to have_many(:sorteos).through(:participaciones) }

  it 'validates default role_id equal to 0' do
    subject = described_class.new()
    expect(subject.role_id).to eq(0)
  end

  it 'validates default role_id equal to user' do
    subject = described_class.new()
    expect(subject.role).to eq(:user)
  end

  context 'validates rol 0 is user' do
    subject = described_class.new(role_id: 0)
    it { expect(subject.user?).to be true }
  end

  context 'validates rol 1 is admin' do
    subject = described_class.new(role_id: 1)
    it { expect(subject.admin?).to be true }
    it { expect(subject.role).to eq(:admin) }
  end
end

# == Schema Information
#
# Table name: usuarios
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  username               :string
#  documento              :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  nombre                 :string
#  apellido1              :string
#  apellido2              :string
#  provincia_id           :integer
#  ciudad                 :string
#  codigopostal           :decimal(, )
#  direccion              :string
#  direccioncompleta      :string
#  fechadenacimiento      :date
#  sexo                   :string
#  movil                  :decimal(, )
#  tipo_documento_id      :integer
#  role_id                :integer          default(0)
#
# Indexes
#
#  index_usuarios_on_confirmation_token    (confirmation_token) UNIQUE
#  index_usuarios_on_email                 (email) UNIQUE
#  index_usuarios_on_reset_password_token  (reset_password_token) UNIQUE
#
