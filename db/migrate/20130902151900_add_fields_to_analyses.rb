class AddFieldsToAnalyses < ActiveRecord::Migration
  def up
    add_column :analyses, :receipt_time, :time
    add_column :analyses, :delivery_time, :time
    change_column :analyses, :receipt_date, :date
    change_column :analyses, :delivery_date, :date
  end

  def down
    remove_column :analyses, :receipt_time
    remove_column :analyses, :delivery_time
    change_column :analyses, :receipt_date, :datetime
    change_column :analyses, :delivery_date, :datetime
  end
end
