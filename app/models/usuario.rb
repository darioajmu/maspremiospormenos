class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :tiposdocumento_id, presence: true
  validates :username, presence: true
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


end
