class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.belongs_to :photos
      t.belongs_to :user
      t.timestamps
    end
  end
end
