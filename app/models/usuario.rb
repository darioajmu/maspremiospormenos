class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :authentication_keys => [:login]
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

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end



end
