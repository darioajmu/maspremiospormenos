class GanadoresSorteo < ActiveRecord::Base
  belongs_to :sorteo

  validates :sorteo_id, presence: true
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
