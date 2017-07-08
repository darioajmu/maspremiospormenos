class Premio < ActiveRecord::Base
  belongs_to :tipo_premio

  validates :nombre, presence: true, uniqueness: true
  validates :codigo, presence: true, uniqueness: true
  validates :tipo_premio_id, presence: true
  validates :fecha_hora_sorteo, presence: true
  validates :numero_participaciones, presence: true, numericality: { greater_than: 0 }
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
#  entregado              :boolean          default(FALSE)
#
