class Analysis < ActiveRecord::Base
  belongs_to :patient, class_name: 'User'
  belongs_to :doctor, class_name: 'User'

  attr_accessor :receipt_time, :delivery_time

  def patient_full_name
    patient.present? ? patient.full_name : ''
  end

  def doctor_full_name
    doctor.present? ? doctor.full_name : ''
  end
end
