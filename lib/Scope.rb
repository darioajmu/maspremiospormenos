module Scope
 extend ActiveSupport::Concern
 included do
  def self.noborrada
   where(fechabaja: nil)
  end
  def self.nada
   where("id< ?", -1)
  end
 end
end

ActiveRecord::Base.send(:include, Scope)
