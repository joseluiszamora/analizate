class ChangeDataTypeForLaboratories < ActiveRecord::Migration
  def self.up
    change_column :laboratories, :result, :string
  end

  def self.down
    change_column :laboratories, :result, :float
  end
end
