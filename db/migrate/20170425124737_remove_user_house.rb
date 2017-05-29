class RemoveUserHouse < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :house, :string
    remove_column :users, :apartment, :string
    add_column :streets, :house, :string
    add_column :streets, :apartment, :string
  end
end
