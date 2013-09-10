class User < ActiveRecord::Base
  
  USER_TYPE = %w(medical patient laboratory_staff)

  before_save :ensure_authentication_token

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, #:confirmable,
         :timeoutable

  scope :patients, -> { where(user_type: 'patient') }
  scope :medical, -> { where(user_type: 'medical') }

  validates :username, uniqueness: { case_sensitive: true }

  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def self.search_by_params(q)
    options = {}
    options.merge!({ name_or_last_name_cont: q }) if q.present?
    qq = search(options)
    qq.result
  end

  def full_name
    "#{ name } #{ last_name }".presence || username.presence || email
  end
end
