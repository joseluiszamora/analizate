class Analysis < ActiveRecord::Base
  belongs_to :patient, class_name: 'User'
  belongs_to :doctor, class_name: 'User'

  has_many :laboratories, dependent: :destroy
  has_many :tests, through: :laboratories
  accepts_nested_attributes_for :laboratories

  validates :patient_id, presence: true

  attr_accessor :patient_type_selector, :patient_name

  def categories
    ids = tests.pluck(:test_category_id).uniq
    TestCategory.where(id: ids)
  end

  def delivery_datetime
    DateTime.parse("#{delivery_date.to_s(:db)} #{delivery_time}") rescue nil
  end

  def doctor_full_name
    doctor.present? ? doctor.full_name : ''
  end

  def patient_full_name
    patient.present? ? patient.full_name : ''
  end

  def receipt_datetime
    DateTime.parse("#{receipt_date.to_s(:db)} #{receipt_time}") rescue nil
  end
end
