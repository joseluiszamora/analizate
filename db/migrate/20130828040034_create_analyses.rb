class CreateAnalyses < ActiveRecord::Migration
  def change
    create_table :analyses do |t|
      t.belongs_to :patient, index: true
      t.belongs_to :doctor, index: true
      t.datetime :receipt_date
      t.datetime :delivery_date

      t.timestamps
    end
  end
end
