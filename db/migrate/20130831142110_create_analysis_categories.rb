class CreateAnalysisCategories < ActiveRecord::Migration
  def change
    create_table :analysis_categories do |t|
      t.belongs_to :analysis, index: true
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
