class AddDescToLaboratories < ActiveRecord::Migration
  def change
    add_column :laboratories, :desc, :text
  end
end
