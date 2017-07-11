require 'rails_helper'

RSpec.describe Sorteo, type: :model do
  it { is_expected.to belong_to :premio }
  it { is_expected.to belong_to :participacion }

  it { is_expected.to validate_presence_of :premio_id }
  it { is_expected.to validate_presence_of :participacion_id }
  it { is_expected.to validate_uniqueness_of :participacion_id }
end

# == Schema Information
#
# Table name: sorteos
#
#  id               :integer          not null, primary key
#  premio_id        :integer
#  participacion_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
