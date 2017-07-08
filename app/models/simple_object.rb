class SimpleObject < ActiveRecord::Base
  validates :nombre, presence: true, uniqueness: true
  validates :codigo, presence: true, uniqueness: true
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
