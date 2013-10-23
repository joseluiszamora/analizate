class User < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  USER_TYPE = %w(medical patient laboratory_staff)

  before_save :ensure_authentication_token

  belongs_to :specialty

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, #:confirmable,
         :timeoutable

  scope :patients, -> { where(role: 'patient') }
  scope :medical, -> { where(role: 'medical') }

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

  def analyses
    if is_medical?
      Analysis.where(doctor_id: self.id)
    elsif is_patient?
      Analysis.where(patient_id: self.id)
    else
      # TODO que es lo que va a poder ver el de laboratorio
      []
    end
  end

  def full_name
    "#{ name } #{ last_name }".presence || username.presence || email
  end

  def contact_numbers
    "#{ phone } #{ cellular }".presence || phone.presence || cellular
  end

  def email_required?
    email.present?
  end

  def is_admin?
    role == 'admin'
  end

  def is_medical?
    role == 'medical'
  end

  def is_patient?
    role == 'patient'
  end

  def is_laboratory_staff?
    role == 'laboratory_staff'
  end

  def specialty_name
    specialty.present? ? specialty.name : ''
  end

  def age
    if birthday.present?
      now = Time.now.to_date
      now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
    else
      0
    end
  end
end
