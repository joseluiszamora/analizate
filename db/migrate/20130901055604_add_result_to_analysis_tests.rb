class AddResultToAnalysisTests < ActiveRecord::Migration
  def change
    add_column :analysis_tests, :result, :float
  end
end
