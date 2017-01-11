class FirstNameToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :sex
      t.date :birthday
      t.text :preference

    end
  end
end
