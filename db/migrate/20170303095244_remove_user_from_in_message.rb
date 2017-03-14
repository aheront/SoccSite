class RemoveUserFromInMessage < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :user_from
    add_reference :messages, :dialog, index: true
  end
end
