class Premio < ActiveRecord::Base

  ESTADOS = {
    no_disponible:   [0],
    disponible:      [1],
    completo:        [2],
    sorteando:       [3],
    sorteado:        [4]
  }

  belongs_to :tipo_premio
  has_many :sorteos

  validates :nombre, presence: true, uniqueness: true
  validates :codigo, presence: true, uniqueness: true
  validates :tipo_premio_id, presence: true
  validates :fecha_hora_sorteo, presence: true
  validates :estado, presence: true
  validates :numero_participaciones, presence: true, numericality: { greater_than: 0 }

  ESTADOS.each do |estado_nombre, estados|
    define_method "#{estado_nombre}?" do
      estados.include?(estado)
    end

    define_method "premio_#{estado_nombre}" do
      update(estado: estados.first)
    end

    self.const_set(estado_nombre.upcase, estados.first)
  end

  def estado_premio
    ESTADOS.each_with_object({}) do |(estado_nombre, estado), hash|
      hash.merge!(estado.first => estado_nombre)
    end[estado]
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
