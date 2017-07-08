class Premio < ActiveRecord::Base
end

# == Schema Information
#
# Table name: premios
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  codigo         :string
#  nombre         :string
#  tipo_premio_id :integer
#
