class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.belongs_to :user
      t.string :source_type
      t.integer :source_id
      t.timestamps
    end
  end
end
