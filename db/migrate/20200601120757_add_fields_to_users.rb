class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :birthdate, :date
    add_column :users, :profile_picture, :string
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
