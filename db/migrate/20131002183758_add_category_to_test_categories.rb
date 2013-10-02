class AddCategoryToTestCategories < ActiveRecord::Migration
  def change
    add_column :test_categories, :category, :string
  end
end
