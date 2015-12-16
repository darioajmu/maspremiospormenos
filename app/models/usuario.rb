class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :authentication_keys => {email: true, login: false}
attr_accessor :login
  validates :username,
  :presence => true,
  :uniqueness => {
  :case_sensitive => false
  }
  validates_format_of :username, :with => /\A[a-zA-Z0-9_\.]+\z/
  #before_save :validate_username

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
  if Usuario.where(email: username).count>0
    errors.add(:username, :invalid)
  end
end

protected
def confirmation_required?
  true
end
end
