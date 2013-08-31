class CreateAnalysisTests < ActiveRecord::Migration
  def change
    create_table :analysis_tests do |t|
      t.belongs_to :test, index: true
      t.belongs_to :analysis_category, index: true

      t.timestamps
    end
  end
end
