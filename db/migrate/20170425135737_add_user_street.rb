class AddUserStreet < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :street, index: true
  end
end
