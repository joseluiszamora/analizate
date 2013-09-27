class AddImageToLaboratories < ActiveRecord::Migration
  def change
    add_column :laboratories, :image, :string
  end
end
