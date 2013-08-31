class RemoveResultToTests < ActiveRecord::Migration
  def change
    remove_column :tests, :result
  end
end
