require 'rails_helper'

RSpec.describe Participacion, type: :model do
    it { is_expected.to belong_to :usuario }

    it { is_expected.to validate_presence_of :usuario_id }

end

# == Schema Information
#
# Table name: participaciones
#
#  id         :integer          not null, primary key
#  usuario_id :integer
#  usada      :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
