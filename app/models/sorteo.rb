class Sorteo < ActiveRecord::Base
  belongs_to :premio
  belongs_to :participacion

  validates :premio_id, presence: true
  validates :participacion_id, presence: true, uniqueness: true
end

# == Schema Information
#
# Table name: sorteos
#
#  id               :integer          not null, primary key
#  premio_id        :integer
#  participacion_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
