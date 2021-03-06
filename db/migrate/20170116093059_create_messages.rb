class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :message_text
      t.belongs_to :user, index: true
      t.integer :user_from, index:true
      t.timestamps
    end
  end
end
