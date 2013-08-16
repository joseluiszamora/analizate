class CreateTestCategories < ActiveRecord::Migration
  def change
    create_table :test_categories do |t|
      t.string :description
      t.string :ancestry

      t.timestamps
    end
    add_index :test_categories, :ancestry
  end
end
