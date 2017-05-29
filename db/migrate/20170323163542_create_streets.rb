class CreateStreets < ActiveRecord::Migration[5.0]
  def change
    create_table :streets do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.belongs_to :city
      t.belongs_to :user
      t.timestamps
    end
  end
end
