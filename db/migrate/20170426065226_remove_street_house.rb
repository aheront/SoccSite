class RemoveStreetHouse < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :house, :string
    add_column :users, :apartment, :string
    remove_column :streets, :house, :string
    remove_column :streets, :apartment, :string
  end
end
