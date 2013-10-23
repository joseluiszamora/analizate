class AddEspecialityToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :especiality, :string
  end
end