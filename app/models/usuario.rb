class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  validates :username,
  :presence => true,
  :uniqueness => {
  :case_sensitive => false
  }
  validates_format_of :username, :with => /\A[a-zA-Z0-9]+\z/
  validate :validate_username

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end
end

def self.find_for_database_authentication(warden_conditions)
  conditions = warden_conditions.dup
  if login = conditions.delete(:login)
    where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  else
    where(conditions.to_h).first
  end


def validate_username
  if User.where(email: username).exists?
    errors.add(:username, :invalid)
  end
end
end
