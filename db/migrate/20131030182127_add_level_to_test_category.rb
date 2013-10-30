class AddLevelToTestCategory < ActiveRecord::Migration
  def change
    add_column :test_categories, :level, :integer
  end
end
