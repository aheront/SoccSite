class RemoveFileFromPhoto < ActiveRecord::Migration[5.0]
  def change
    remove_column :photos, :file
  end
end
