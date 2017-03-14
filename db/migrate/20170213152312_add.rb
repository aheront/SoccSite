class Add < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :photo, index: true
  end
end
