require 'rails_helper'

RSpec.describe SimpleObject, type: :model do
  it { is_expected.to validate_presence_of :codigo }
  it { is_expected.to validate_uniqueness_of :codigo }
  it { is_expected.to validate_presence_of :nombre }
  it { is_expected.to validate_uniqueness_of :nombre }
end

# == Schema Information
#
# Table name: simple_objects
#
#  id         :integer          not null, primary key
#  type       :string
#  codigo     :string
#  nombre     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
