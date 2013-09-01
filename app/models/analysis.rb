class Analysis < ActiveRecord::Base
  belongs_to :patient, class_name: 'User'
  belongs_to :doctor, class_name: 'User'

  has_many :analysis_categories, dependent: :destroy
  has_many :categories, through: :analysis_categories, class_name: 'TestCategory'
  accepts_nested_attributes_for :analysis_categories

  validates :patient_id, :doctor_id, presence: true

  attr_accessor :receipt_time, :delivery_time

  def patient_full_name
    patient.present? ? patient.full_name : ''
  end

  def doctor_full_name
    doctor.present? ? doctor.full_name : ''
  end
end
