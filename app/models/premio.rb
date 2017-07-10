class Premio < ActiveRecord::Base

  ESTADOS = {
    no_disponible:   [0],
    disponible:      [1],
    sorteando:       [2],
    sorteado:        [3]
  }

  belongs_to :tipo_premio
  has_many :sorteos

  validates :nombre, presence: true, uniqueness: true
  validates :codigo, presence: true, uniqueness: true
  validates :tipo_premio_id, presence: true
  validates :fecha_hora_sorteo, presence: true
  validates :numero_participaciones, presence: true, numericality: { greater_than: 0 }

  ESTADOS.each do |estado_nombre, estado_ids|
    define_method "#{estado_nombre}?" do
      role_ids.include?(estado_ids)
    end
  end

  def estado
    ESTADOS.each_with_object({}) do |(estado_nombre, estado_ids), hash|
      hash.merge!(estado_ids.first => estado_nombre)
    end[estado_id]
  end

  def premio_sorteado
    update(estado: SORTEADO)
  end
end

# == Schema Information
#
# Table name: premios
#
#  id                     :integer          not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  codigo                 :string
#  nombre                 :string
#  tipo_premio_id         :integer
#  fecha_hora_sorteo      :datetime
#  numero_participaciones :integer
#  estado                 :integer          default(0)
#
