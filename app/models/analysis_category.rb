class AnalysisCategory < ActiveRecord::Base
  belongs_to :analysis
  belongs_to :category, class_name: 'TestCategory'
end
