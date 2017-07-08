class Participacion < ActiveRecord::Base
  belongs_to :usuario
  has_many :sorteos

  validates :usuario_id, presence: true
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
