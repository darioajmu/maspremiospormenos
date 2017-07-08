require 'rails_helper'

RSpec.describe GanadoresSorteo, type: :model do
  it { is_expected.to belong_to :sorteo }

  it { is_expected.to validate_presence_of :sorteo_id }
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
