class GanadoresSorteo < ActiveRecord::Base
  belongs_to :sorteo
  delegate :premio, to: :sorteo
  delegate :participacion, to: :sorteo
  delegate :usuario, to: :participacion

  validates :sorteo_id, presence: true
  validate :check_sorteo_prize

  def check_sorteo_prize
    errors.add(:premio_id, "ya ha tenido un ganador") if sorteo && GanadoresSorteo.where(sorteo_id: premio.sorteos.ids).any?
  end
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
