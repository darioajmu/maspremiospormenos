class Premio < ActiveRecord::Base
  validates :nombre, presence: true, uniqueness: true
  validates :codigo, presence: true, uniqueness: true
  validates :tipo_premio_id, presence: true

  belongs_to :tipo_premio
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
