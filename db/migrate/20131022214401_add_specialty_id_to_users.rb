class AddSpecialtyIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :specialty_id, :integer
  end
end
