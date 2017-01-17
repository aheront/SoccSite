class CreateUserToGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :user_to_groups do |t|
      t.belongs_to :user
      t.belongs_to :groups
      t.timestamps
    end
  end
end
