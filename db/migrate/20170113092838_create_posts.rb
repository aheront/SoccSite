class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :text
      t.string :source_type
      t.integer :source_id
      t.timestamps
    end
  end
end
