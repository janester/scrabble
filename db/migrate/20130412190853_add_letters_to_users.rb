class AddLettersToUsers < ActiveRecord::Migration
  def change
    add_column :users, :letters, :string
  end
end
