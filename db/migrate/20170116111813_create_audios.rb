class CreateAudios < ActiveRecord::Migration[5.0]
  def change
    create_table :audios do |t|
      t.string :name
      t.string :source_type
      t.integer :source_id
      t.timestamps
    end
  end
end
