class ChangeDataTypeForTestsReferenceValues < ActiveRecord::Migration
  def self.up
    change_column :tests, :reference_values, :text
  end

  def self.down
    change_column :tests, :reference_values, :string
  end
end