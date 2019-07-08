class ChangeNameColumnToUser < ActiveRecord::Migration[5.2]

  def up
    change_column :users, :name, :string, null: false
    add_index :users, :name, unique: true
  end

  def down
    change_column :users, :name, :string
    remove_index :users, :name
  end

end
