class AddPatientNameToAnalyses < ActiveRecord::Migration
  def change
    add_column :analyses, :patient_name, :string
    add_column :analyses, :patient_type_selector, :boolean, default: false
  end
end
