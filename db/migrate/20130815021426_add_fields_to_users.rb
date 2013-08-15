class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, null: false, default: ''
    add_column :users, :user_type, :string
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :cellular, :string
    add_column :users, :birthday, :date
    add_column :users, :notes, :text

    add_index :users, :username, unique: true
  end
end
