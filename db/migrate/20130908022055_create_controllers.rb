class CreateControllers < ActiveRecord::Migration
  def change
    create_table :controllers do |t|
      t.string :home

      t.timestamps
    end
  end
end
