class AddToGroupPhotoId < ActiveRecord::Migration[5.0]
  def change
    add_reference :groups, :photo, index: true
  end
end
