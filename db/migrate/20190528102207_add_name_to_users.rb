class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :biography, :text
    add_column :users, :native_language, :string
    add_column :users, :photo, :string
    add_column :users, :nationality, :string
    add_column :users, :teacher_rating, :float
  end
end
