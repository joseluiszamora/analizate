class AnalysisCategory < ActiveRecord::Base
  belongs_to :analysis
  belongs_to :category, class_name: 'TestCategory'

  has_many :analysis_tests, dependent: :destroy
  has_many :tests, through: :analysis_tests, dependent: :destroy
end
