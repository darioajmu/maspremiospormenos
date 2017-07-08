require 'rails_helper'

RSpec.describe Premio, type: :model do
  it { is_expected.to validate_presence_of :codigo }
  it { is_expected.to validate_uniqueness_of :codigo }
  it { is_expected.to validate_presence_of :nombre }
  it { is_expected.to validate_uniqueness_of :nombre }
  it { is_expected.to validate_presence_of :tipo_premio_id }
  # it { is_expected.to belong_to :tipo_premio }
  it { is_expected.to belong_to :tipo_premio }
end
