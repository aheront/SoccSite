class FirstNameToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.integer :sex
    end
  end
end
