class Analysis < ActiveRecord::Base
  belongs_to :patient, class_name: 'User'
  belongs_to :other, class_name: 'User', foreign_key: 'patient_id'
  belongs_to :doctor, class_name: 'User'

  has_many :laboratories, dependent: :destroy
  has_many :tests, through: :laboratories
  accepts_nested_attributes_for :laboratories, allow_destroy: true

  validates :patient_id, presence: true, if: proc { |a| a.patient_type_selector == false }

  def self.searching(q)
    options = {}
    options.merge!({ patient_name_or_other_name_or_other_last_name_or_doctor_name_or_doctor_last_name_cont: q }) if q.present?
    qq = search(options)
    qq.result
  end

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
    if patient_type_selector == true
      patient_name
    else
      patient.present? ? patient.full_name : ''
    end
  end

  def receipt_datetime
    DateTime.parse("#{receipt_date.to_s(:db)} #{receipt_time}") rescue nil
  end
end
