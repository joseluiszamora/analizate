class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :parameter
      t.float :result
      t.string :unit
      t.string :reference_values
      t.string :test_type
      t.text :description
      t.string :image
      t.belongs_to :test_category, index: true

      t.timestamps
    end
  end
end
