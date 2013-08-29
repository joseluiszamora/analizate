class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :category
      t.string :name
      t.text :address
      t.text :desc
      t.string :phone
      t.string :mail
      t.string :web

      t.timestamps
    end
  end
end
