class AnalysisSerializer < ActiveModel::Serializer
  attributes :id, :receipt_date, :delivery_date
  has_one :patient
  has_one :doctor
end
