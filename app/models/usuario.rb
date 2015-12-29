class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  attr_accessor :login

  validates :tiposdocumento_id, presence: true
  validates :username, presence: true, :uniqueness => {:case_sensitive => false}
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true 
  validates :documento, presence: true
  validates :nombre, presence: true
  validates :apellido1, presence: true
  validates :apellido2, presence: true
  validates :provincia_id, presence: true
  validates :ciudad, presence: true
  validates :codigopostal, presence: true
  validates :direccion, presence: true
  validates :fechadenacimiento, presence: true
  validates :movil, presence: true
  validates :sexo, presence: true

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_hash).first
    end
  end



end
