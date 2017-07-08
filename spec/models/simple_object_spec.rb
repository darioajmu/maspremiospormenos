require 'rails_helper'

RSpec.describe SimpleObject, type: :model do
  it { is_expected.to validate_presence_of :codigo }
  it { is_expected.to validate_uniqueness_of :codigo }
  it { is_expected.to validate_presence_of :nombre }
  it { is_expected.to validate_uniqueness_of :nombre }
end
