class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.belongs_to :user
      t.string :name
      t.timestamps
    end
  end
end
