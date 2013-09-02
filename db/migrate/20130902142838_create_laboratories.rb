class CreateLaboratories < ActiveRecord::Migration
  def change
    create_table :laboratories do |t|
      t.belongs_to :analysis, index: true
      t.belongs_to :test, index: true
      t.float :result

      t.timestamps
    end
  end
end
