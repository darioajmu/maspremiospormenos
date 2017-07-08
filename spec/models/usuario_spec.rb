require 'rails_helper'

RSpec.describe Usuario, type: :model do
  describe "Validations" do
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
    it { is_expected.to validate_presence_of :sexo }
    it { is_expected.to allow_value('user.example').for(:username) }
  end

  # validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
end
