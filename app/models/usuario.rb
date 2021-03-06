class Usuario < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :authentication_keys => [:login]
  attr_accessor :login

  ROLES = {
    user:       [0],
    admin:      [1]
  }

  belongs_to :tipo_documento
  has_many :participaciones
  has_many :sorteos, through: :participaciones

  validates :tipo_documento_id, presence: true
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
  validates :role_id, presence: true

  ROLES.each do |role_name, role_ids|
    define_method "#{role_name}?" do
      role_ids.include?(role_id)
    end

    self.const_set(role_name.upcase, role_ids.first)
  end

  def role
    ROLES.each_with_object({}) do |(role_name, role_ids), hash|
      hash.merge!(role_ids.first => role_name)
    end[role_id]
  end

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

# == Schema Information
#
# Table name: usuarios
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  username               :string
#  documento              :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  nombre                 :string
#  apellido1              :string
#  apellido2              :string
#  provincia_id           :integer
#  ciudad                 :string
#  codigopostal           :decimal(, )
#  direccion              :string
#  direccioncompleta      :string
#  fechadenacimiento      :date
#  sexo                   :string
#  movil                  :decimal(, )
#  tipo_documento_id      :integer
#  role_id                :integer          default(0)
#
# Indexes
#
#  index_usuarios_on_confirmation_token    (confirmation_token) UNIQUE
#  index_usuarios_on_email                 (email) UNIQUE
#  index_usuarios_on_reset_password_token  (reset_password_token) UNIQUE
#
