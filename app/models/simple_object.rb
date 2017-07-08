class SimpleObject < ActiveRecord::Base
  validates :nombre, presence: true, uniqueness: { scope: :type }
  validates :codigo, presence: true, uniqueness: { scope: :type }
end

# == Schema Information
#
# Table name: simple_objects
#
#  id         :integer          not null, primary key
#  type       :string
#  codigo     :string
#  nombre     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
