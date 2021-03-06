class Participacion < ActiveRecord::Base
  belongs_to :usuario
  has_many :sorteos

  validates :usuario_id, presence: true

  scope :no_usadas, -> { where(usada: false) }

  def make_participation_used
    update(usada: true)
  end
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
