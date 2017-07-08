class Sorteo < ActiveRecord::Base
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
